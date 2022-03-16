cmake_minimum_required(VERSION 3.15)

SET(PROJECT_NAME qt-canvas)

project(${PROJECT_NAME} VERSION 0.1 LANGUAGES C CXX)

set(CMAKE_INCLUDE_CURRENT_DIR ON)

set(CMAKE_AUTOUIC ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)

set(CMAKE_C_STANDARD 23)
set(CMAKE_CXX_STANDARD 23)

include_directories(${PROJECT_SOURCE_DIR})
include_directories(${PROJECT_SOURCE_DIR}/include)
link_directories(${PROJECT_SOURCE_DIR}/lib)

find_package(PkgConfig REQUIRED)

# Mac系统使用内置的pthreads
IF(APPLE)
    set(CMAKE_THREAD_LIBS_INIT "-lpthread")
    set(CMAKE_HAVE_THREADS_LIBRARY 1)
    set(CMAKE_USE_WIN32_THREADS_INIT 0)
    set(CMAKE_USE_PTHREADS_INIT 1)
    set(THREADS_PREFER_PTHREAD_FLAG ON)
ENDIF()

find_package(Qt6 COMPONENTS Core REQUIRED)

set(PROJECT_SOURCES
        src/main.cpp
        src/stele/stele.cpp src/stele/stele.h
        src/md5.cc src/md5.h
        src/wasm/wasm.h
        ${PROJECT_SOURCE_DIR}/src/markdown/mdtransform.hpp
        ${PROJECT_SOURCE_DIR}/src/markdown/mdtransform.cpp)

qt_add_executable(${PROJECT_NAME}
        MANUAL_FINALIZATION
        ${PROJECT_SOURCES})

target_link_libraries(${PROJECT_NAME}
        PRIVATE Qt${QT_VERSION_MAJOR}::Core)

# 当编译WebAssembly时修改链接参数，否则会报初始内存太小错误
if (EMSCRIPTEN)
    target_link_options(${PROJECT_NAME} PRIVATE -s TOTAL_MEMORY=32MB)
endif ()

qt_finalize_executable(${PROJECT_NAME})

add_executable(cmain src/main.c)
target_link_libraries(cmain hello_wasm)

add_subdirectory(src/hello_world)
add_subdirectory(src/bin/structs_library)

if (NOT EMSCRIPTEN)

    find_package(Boost COMPONENTS system thread REQUIRED)

    pkg_check_modules(ctemplate REQUIRED IMPORTED_TARGET libctemplate)

    add_executable(sfx-server
            src/services/config/aws/init.cpp src/services/config/aws/init.h
            src/main.cc
            src/server/http_connection.cc
            src/server/state.cc
            src/utils/md5.cc src/server/handlers/index.cpp src/server/handlers/index.h
            src/utils/mime.h src/utils/mime.cpp
            src/services/markdown/markdown.cpp src/services/markdown/mdtransform.hpp src/services/markdown/markdown.h
            src/services/config/aws/appconfig.cpp src/services/config/aws/appconfig.h src/services/database/postgresql/pq.cpp
            src/services/database/postgresql/pq.h src/services/database/postgresql/init.cpp
            src/services/database/postgresql/init.h src/server/handlers/sitemap.cpp src/server/handlers/sitemap.h
            src/models/article.cpp src/models/article.h src/utils/datetime.cpp src/utils/datetime.h
            src/utils/ctemplate.cc src/utils/ctemplate.h)

    target_include_directories(sfx-server PRIVATE ${Boost_INCLUDE_DIRS})
    target_link_libraries(sfx-server ${Boost_LIBRARIES} PkgConfig::ctemplate)

endif()


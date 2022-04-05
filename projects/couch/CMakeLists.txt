cmake_minimum_required(VERSION 3.15)

project(couch VERSION 0.1 LANGUAGES C CXX)

set(CMAKE_INCLUDE_CURRENT_DIR ON)

#set(CMAKE_AUTOUIC ON)
#set(CMAKE_AUTOMOC ON)
#set(CMAKE_AUTORCC ON)

set(CMAKE_C_STANDARD 23)
set(CMAKE_CXX_STANDARD 23)

include_directories(${PROJECT_SOURCE_DIR})
include_directories(${PROJECT_SOURCE_DIR}/include)
link_directories(${PROJECT_SOURCE_DIR}/lib)

# Mac系统使用内置的pthreads
#IF(APPLE)
#    set(CMAKE_THREAD_LIBS_INIT "-lpthread")
#    set(CMAKE_HAVE_THREADS_LIBRARY 1)
#    set(CMAKE_USE_WIN32_THREADS_INIT 0)
#    set(CMAKE_USE_PTHREADS_INIT 1)
#    set(THREADS_PREFER_PTHREAD_FLAG ON)
#ENDIF()


#qt6_add_executable(couch MANUAL_FINALIZATION src/main.cpp)
#qt6_add_executable(couch src/main.cpp)

add_executable(couch  src/main.cpp
        src/wasm.h
        src/markdown/mdtransform.hpp
        src/markdown/mdtransform.cpp)
#target_link_libraries(couch PRIVATE Qt6::Core)

# 当编译WebAssembly时修改链接参数，否则会报初始内存太小错误
if (EMSCRIPTEN)
    target_link_options(couch PRIVATE -s TOTAL_MEMORY=32MB)
endif ()

#qt_finalize_executable(couch)


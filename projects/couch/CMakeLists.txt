cmake_minimum_required(VERSION 3.21)

project(couch VERSION 0.1 LANGUAGES C CXX)

set(CMAKE_INCLUDE_CURRENT_DIR ON)

set(CMAKE_C_STANDARD 23)
set(CMAKE_CXX_STANDARD 23)


include_directories(${PROJECT_SOURCE_DIR})

find_package(Qt6 COMPONENTS Core REQUIRED)

set(COUCH_SOURCES
        src/wasm/wasm.cpp
        src/markdown/mdtransform.hpp
        src/markdown/mdtransform.cpp
        src/utils/md5.cc
        src/utils/md5.h)

# 当编译WebAssembly时修改链接参数，否则会报初始内存太小错误
if (EMSCRIPTEN)
    add_executable(couch_bg src/main.cpp ${COUCH_SOURCES})
    target_link_options(couch_bg PRIVATE  "SHELL:-s TOTAL_MEMORY=32MB"
            "SHELL:-s MODULARIZE=1"
            "SHELL:-s EXPORT_NAME=Couch"
            "SHELL:-l embind")
    target_link_libraries(couch_bg PRIVATE Qt6::Core)

    install(FILES ${CMAKE_BINARY_DIR}/couch_bg.js ${CMAKE_BINARY_DIR}/couch_bg.wasm
            DESTINATION ${PROJECT_SOURCE_DIR}/out/wasm)
else()
    add_library(couch_shared SHARED
            ${COUCH_SOURCES}
            src/markdown/markdown.cpp src/markdown/markdown.h)
    target_link_options(couch_shared PRIVATE "SHELL:-lm" "SHELL:-pthread")
    target_link_libraries(couch_shared PRIVATE Qt6::Core)
    if (APPLE)
        message(STATUS "Apple OS")
        set(CMAKE_OSX_ARCHITECTURES "x86_64;arm64" CACHE STRING "Build architectures for Mac OS X" FORCE)
        set(CMAKE_OSX_DEPLOYMENT_TARGET "10.14")
    endif()

    set_target_properties(couch_shared
            PROPERTIES
            PUBLIC_HEADER src/markdown/markdown.h)
    set(CMAKE_INSTALL_RPATH ".")
    set_target_properties(couch_shared PROPERTIES INSTALL_RPATH_USE_LINK_PATH TRUE)

    install(TARGETS couch_shared
                RUNTIME_DEPENDENCY_SET couch_shared_dependencies
                LIBRARY DESTINATION ${PROJECT_SOURCE_DIR}/out/lib
                ARCHIVE DESTINATION ${PROJECT_SOURCE_DIR}/out/lib
                PUBLIC_HEADER DESTINATION ${PROJECT_SOURCE_DIR}/out/include)

    install(RUNTIME_DEPENDENCY_SET couch_shared_dependencies
            DESTINATION ${PROJECT_SOURCE_DIR}/out/lib
            PRE_EXCLUDE_REGEXES "*.h")
endif ()

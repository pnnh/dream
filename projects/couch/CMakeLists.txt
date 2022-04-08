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

#add_library(couch)
#target_link_options(couch PRIVATE "SHELL:-mmacosx-version-min=10.14")
#target_link_libraries(couch PRIVATE Qt6::Core -static)

# 当编译WebAssembly时修改链接参数，否则会报初始内存太小错误
if (EMSCRIPTEN)
#    add_executable(couch_bg src/main.cpp)
#    add_dependencies(couch_bg couch)
#    target_link_options(couch PRIVATE  "SHELL:-s TOTAL_MEMORY=32MB"
#            "SHELL:-s MODULARIZE=1"
#            "SHELL:-s EXPORT_NAME=Couch"
#            "SHELL:-l embind")
#    target_link_libraries(couch_bg PRIVATE couch)
#
#    install(FILES ${CMAKE_BINARY_DIR}/couch_bg.js ${CMAKE_BINARY_DIR}/couch_bg.wasm
#            DESTINATION ${PROJECT_SOURCE_DIR}/out/wasm)
else()
    add_library(couch_shared SHARED
            ${COUCH_SOURCES}
            src/markdown/markdown.cpp src/markdown/markdown.h)
    #add_dependencies(couch_shared couch)
    target_link_options(couch_shared PRIVATE "SHELL:-lm" "SHELL:-pthread")
    target_link_options(couch_shared PRIVATE "SHELL:-mmacosx-version-min=10.14")
    #target_link_libraries(couch_shared PRIVATE couch)
    target_link_libraries(couch_shared PRIVATE Qt6::Core -static)


    set_target_properties(couch_shared
            PROPERTIES
            PUBLIC_HEADER src/markdown/markdown.h)

    install(TARGETS couch_shared
                RUNTIME_DEPENDENCY_SET couch_shared_dependencies
                LIBRARY DESTINATION ${PROJECT_SOURCE_DIR}/out/lib
                ARCHIVE DESTINATION ${PROJECT_SOURCE_DIR}/out/lib
                PUBLIC_HEADER DESTINATION ${PROJECT_SOURCE_DIR}/out/include)

    install(RUNTIME_DEPENDENCY_SET couch_shared_dependencies
            DESTINATION ${PROJECT_SOURCE_DIR}/out/lib
            PRE_EXCLUDE_REGEXES "*.h")

#    install(TARGETS couch_shared RUNTIME_DEPENDENCIES
##            LIBRARY DESTINATION ${PROJECT_SOURCE_DIR}/out/lib
##            FRAMEWORK DESTINATION ${PROJECT_SOURCE_DIR}/out/lib
#            DESTINATION ${PROJECT_SOURCE_DIR}/out/lib
#           PRE_EXCLUDE_REGEXES "*.h"
#            )
endif ()


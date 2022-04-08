cmake_minimum_required(VERSION 3.15)

project(example_native VERSION 0.1 LANGUAGES C)

set(CMAKE_INCLUDE_CURRENT_DIR ON)

set(CMAKE_C_STANDARD 23)

include_directories(${PROJECT_SOURCE_DIR})
include_directories(${PROJECT_SOURCE_DIR}/../../out/include)
link_directories(${PROJECT_SOURCE_DIR}/../../out/lib)

set(CMAKE_MACOSX_RPATH 1)
set(CMAKE_BUILD_RPATH ${PROJECT_SOURCE_DIR}/../../out/lib)

add_executable(example_native src/main.c)
target_link_libraries(example_native PRIVATE couch_shared)

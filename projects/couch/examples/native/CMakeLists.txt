cmake_minimum_required(VERSION 3.15)

project(example_native VERSION 0.1 LANGUAGES C)

set(CMAKE_INCLUDE_CURRENT_DIR ON)

set(CMAKE_C_STANDARD 23)

include_directories(${PROJECT_SOURCE_DIR})
include_directories(${PROJECT_SOURCE_DIR}/../../out/include)
link_directories(${PROJECT_SOURCE_DIR}/../../out/lib)

set(CMAKE_INSTALL_PREFIX ${PROJECT_SOURCE_DIR}/out)

#set(CMAKE_BUILD_RPATH ${PROJECT_SOURCE_DIR}/../../out/lib)
set(CMAKE_INSTALL_RPATH ".")

message(STATUS "CMAKE_INSTALL_PREFIX：${CMAKE_INSTALL_PREFIX}" )

add_executable(example_native src/main.c)
target_link_libraries(example_native PRIVATE couch_shared)

set_target_properties(example_native PROPERTIES INSTALL_RPATH_USE_LINK_PATH TRUE)

install(TARGETS example_native
        RUNTIME_DEPENDENCY_SET example_native_dependencies
        RUNTIME DESTINATION ${CMAKE_INSTALL_PREFIX}
        LIBRARY DESTINATION ${CMAKE_INSTALL_PREFIX}
        ARCHIVE DESTINATION ${CMAKE_INSTALL_PREFIX}
        PUBLIC_HEADER DESTINATION ${CMAKE_INSTALL_PREFIX}/include)

install(RUNTIME_DEPENDENCY_SET example_native_dependencies
        DESTINATION ${CMAKE_INSTALL_PREFIX}
        PRE_EXCLUDE_REGEXES "*.h")
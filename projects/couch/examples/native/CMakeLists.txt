
if (NOT EMSCRIPTEN)
    add_executable(example_native src/main.c)
    add_dependencies(example_native couch_shared)
    target_link_libraries(example_native PRIVATE couch_shared)
endif ()

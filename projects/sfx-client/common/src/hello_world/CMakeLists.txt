

if (NOT EMSCRIPTEN)
    add_library(hello_library SHARED hello.c)
    add_executable(hello_test hello.c)

    set_target_properties(hello_library PROPERTIES
            PUBLIC_HEADER hello.h
            VERSION ${PROJECT_VERSION}
            SOVERSION 1
            OUTPUT_NAME "hello"
            XCODE_ATTRIBUTE_CODE_SIGN_IDENTITY "Hex_Identity_ID_Goes_Here"
            )
endif ()
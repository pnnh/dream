#include <stdio.h>
#include "include/markdown.h"

int main(int argc, char *argv[]) {

    printf("********************************\n");

    const char* result = markdownToJson("## hello\nworld");

    printf("%s\n", result);
}
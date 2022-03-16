#include "hello_wasm.h"
#include <stdio.h>
#include <stdlib.h>

int file_size(char * file_name) {
    FILE *fp = fopen(file_name, "rb");
    int size;
    if (fp == NULL)
        return -1;
    fseek(fp, 0, SEEK_END);
    size = ftell(fp);
    fclose(fp);
    return size;
}

int main() {
    int size = 0;
    const char* c_url = "http://localhost:8080/upload";
    size = file_size("static/test.md");
    FILE *fp;
    char *buffer = (char*)malloc(sizeof(char) *size);
    fp = fopen("static/test.md", "rb");
    if (fp == NULL) {
        return 0;
    }
    fread(buffer, 1, size, fp);
    fclose(fp);
    payload_t payload;
    payload_t *payload_ptr = malloc(sizeof(payload));
    const uint8_t *buffer_ptr = (uint8_t *)buffer;
    payload_ptr->data = buffer_ptr;
    payload_ptr->len = size;
    int32_t flag = post_image(c_url, payload_ptr);
    if(flag == 1) {
        printf("%s\n", "上传成功");
    } else {
        printf("%s\n", "上传失败");
    }
    free(buffer);
    buffer = NULL;
    return 0;
}
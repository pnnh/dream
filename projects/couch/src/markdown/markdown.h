//
// Created by ubuntu on 2/17/22.
//

#ifndef INCLUDE_MARKDOWN_H
#define INCLUDE_MARKDOWN_H


#ifdef __cplusplus
extern "C" {
#endif

const char* markdownToJson(const char *data);

void releaseString(const char* ptr);

#ifdef __cplusplus
}
#endif

#endif //INCLUDE_MARKDOWN_H
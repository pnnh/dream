//
// Created by Larry on 2021/12/11.
//

#ifndef QT_CANVAS_WASM_H
#define QT_CANVAS_WASM_H

#include <string>
#include "include/markdown.h"
#include "src/markdown/mdtransform.hpp"

extern "C" {

const char *markdownToJson(const char *data) {
    const std::string content{data};
    auto value = new std::string(markdown2json(content));
    return value->c_str();
}

void releaseString(const char *ptr) {
    //throw std::runtime_error("not implemented");
    delete ptr;
}

}

#endif //QT_CANVAS_WASM_H

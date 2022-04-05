尝试用C++编写WebAssembly，并打包为npm包发布

## WebAssembly

需要提前安装emscripten sdk

```bash
-DCMAKE_TOOLCHAIN_FILE=/opt/emsdk/upstream/emscripten/cmake/Modules/Platform/Emscripten.cmake
```

## 其它说明

* 修改了CMakeLists.txt文件，通过条件变量设置在LINUX或MAC下编译main.cc文件，在WebAssembly环境下不编译
* 提供Markdown转JSON功能
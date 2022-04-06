尝试用C++编写WebAssembly，并打包为npm包发布

## WebAssembly

需要提前安装emscripten sdk

```bash
mkdir build
cd build
cmake -DCMAKE_TOOLCHAIN_FILE=/opt/emsdk/upstream/emscripten/cmake/Modules/Platform/Emscripten.cmake \
  --verbose ..
```



## 其它说明

* 修改了CMakeLists.txt文件，通过条件变量设置在LINUX或MAC下编译main.cc文件，在WebAssembly环境下不编译
* 提供Markdown转JSON功能
* 使用embind需要在链接参数内加上-l embind
* 通过embind暴露c++方法到js，定义需要写到.cpp文件内，只写到.h文件内似乎不行
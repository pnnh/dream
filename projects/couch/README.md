尝试用C++编写WebAssembly，并打包为npm包发布

## WebAssembly

需要提前安装emscripten sdk

```bash
mkdir build && cd build
cmake -DCMAKE_TOOLCHAIN_FILE=/opt/emsdk/upstream/emscripten/cmake/Modules/Platform/Emscripten.cmake \
  --verbose ..
```

## 采用Qt工具链文件

macOS

```bash
-DCMAKE_PREFIX_PATH=~/Qt/6.3.0/macos/lib/cmake
```

```bash
-DCMAKE_TOOLCHAIN_FILE:PATH=~/Qt/6.3.0/wasm_32/lib/cmake/Qt6/qt.toolchain.cmake
```

## 其它说明

* 修改了CMakeLists.txt文件，通过条件变量设置在LINUX或MAC下编译main.cc文件，在WebAssembly环境下不编译
* 提供Markdown转JSON功能
* 使用embind需要在链接参数内加上-l embind
* 通过embind暴露c++方法到js，定义需要写到.cpp文件内，只写到.h文件内似乎不行
* 尝试将工具链文件改回qt，因为需要使用一些qt的组件库
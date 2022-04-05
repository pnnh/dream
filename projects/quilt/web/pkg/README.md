尝试用Rust或者C++编写WebAssembly

# C++部分

使用了Qt6作为组件

## CLion下测试

```shell
# 配置了以下cmake参数
-DCMAKE_PREFIX_PATH=~/Qt/6.2.0/macos/lib/cmake
-DCMAKE_TOOLCHAIN_FILE:PATH=~/Qt/6.2.0/wasm_32/lib/cmake/Qt6/qt.toolchain.cmake
```

## 其它说明

* 修改了CMakeLists.txt文件，通过条件变量设置在LINUX或MAC下编译main.cc文件，在WebAssembly环境下不编译

# Rust部分

构建命令

```bash
wasm-pack build --scope pnnh --target web
```

安装cbindgen

```bash
cargo install cbindgen
```

生成C头文件

```bash
cbindgen --config cbindgen.toml --crate dream --output include/hello_wasm.h
```

编译动态链接库

```bash
cargo build
```
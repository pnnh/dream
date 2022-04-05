尝试用Rust编写WebAssembly

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

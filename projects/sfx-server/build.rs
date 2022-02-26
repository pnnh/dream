// extern crate cmake;
//
// use cmake::Config;
//
// fn main() {
//     let dst = Config::new(".").build();
//     println!("xxx {}", dst.display());
//     println!("cargo:rustc-link-search=native={}", dst.display());
//     println!("cargo:rustc-link-lib=dylib=sfx_server_common");
// }

fn main() {
    println!("cargo:rustc-link-arg=-Wl,-rpath={}", "/home/ubuntu/Projects/sfxui/projects/sfx-server/cmake-build-debug");
    println!("cargo:rustc-link-lib=dylib=sfx_server_common");
    println!("cargo:rustc-link-search=native=/home/ubuntu/Projects/sfxui/projects/sfx-server/cmake-build-debug");
}
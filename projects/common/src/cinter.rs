use std::os::raw::{c_char, c_int};
use std::ffi::CStr;

#[repr(C)]
pub struct payload_t {
    data: *const u8,
    len: c_int
}

#[no_mangle]
pub extern "C" fn post_image(c_url: *const c_char, payload_ptr: *const payload_t) -> i32 {
    // 在这里开始一步步将c字符串转换成&str
    let c_str: &CStr = unsafe {
        CStr::from_ptr(c_url)
    };

    if let Err(err) = c_str.to_str() {
        eprintln!("{}", err.to_string());
        return 0;
    }
    let str_url = c_str.to_str().unwrap();

    // 在这里开始将c传过来的文件，转换成&[u8]
    let r_payload = unsafe {
        *Box::from_raw(payload_ptr as *mut payload_t)
    };

    let bytes = unsafe {
        std::slice::from_raw_parts(r_payload.data, r_payload.len as usize)
    };

    // 开始上传文件
    if post(str_url, bytes) {
        return 1;
    }

    return 0;
}

fn post(str_url: &str, payload: &[u8]) -> bool {
    let body_base64 = base64::encode(payload);
    println!("url: {} \nbase64: {}", str_url, body_base64);
    return true;
}
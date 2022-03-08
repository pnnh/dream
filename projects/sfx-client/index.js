import init, {excited_greeting, init_console_error_panic_hook, random_greeting, random_string} from "@pnnh/hello-wasm";

// init().then((_exports) => {
//     let result = greet('WebAssembly')
//     console.log("hello8", result)
//     const result2 = excited_greeting("hasOwnProperty")
//     console.log("hello9", result2)
// }).catch(err => {
//     console.error("error: ", err)
// })


export async function sayHello() {
    console.log("hello6")
    await init()
    const result2 = excited_greeting("hasOwnProperty")
    console.log("hello9", result2)
    const a = random_greeting(16)
    console.log('received', a)
    const c = random_string(16, true, true, true, true);
    console.log('random: ', c)
    return c
}

async function randomString(length, hasNumber, hasLetter, hasUppercase, hasSymbol) {
    await init()
    init_console_error_panic_hook()
    console.log('random: ')
    const result = random_string(length, hasNumber, hasLetter, hasUppercase, hasSymbol);
    console.log('random2222: ', result)
    return result
}

window.sayHello = sayHello
window.randomString = randomString
import init, {excited_greeting, random_greeting, random_string} from "@pnnh/hello-wasm";

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

window.sayHello = sayHello


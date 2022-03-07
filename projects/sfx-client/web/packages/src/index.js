import init, {greet} from '@pnnh/hello-wasm'

init().then((_exports) => {
  greet('WebAssembly')
})

export function sayHello() {
  console.log("hello6")
}

window.sayHello = sayHello

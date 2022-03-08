import ReactDOM from 'react-dom'
import React from 'react'
import init, {excited_greeting, random_greeting} from '@pnnh/hello-wasm'

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
}

function App() {
    sayHello().then()
    return <div></div>
}

const rootElement = document.getElementById('root')
if (rootElement) {
    ReactDOM.render(<App/>, rootElement)
}
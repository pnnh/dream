import ReactDOM from 'react-dom'
import React from 'react'
import init, {random_string} from '@pnnh/hello-wasm'

// init().then((_exports) => {
//     let result = greet('WebAssembly')
//     console.log("hello8", result)
//     const result2 = excited_greeting("hasOwnProperty")
//     console.log("hello9", result2)
// }).catch(err => {
//     console.error("error: ", err)
// })


export async function sayHello() {
    await init()
    const a = random_string(16, true, false, false, false)
    console.log('received', a)
}

function App() {
    return <div>
        <button onClick={() => {
            sayHello().then()
        }}>随机
        </button>
    </div>
}

const rootElement = document.getElementById('root')
if (rootElement) {
    ReactDOM.render(<App/>, rootElement)
}
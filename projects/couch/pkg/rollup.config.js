import commonjs from '@rollup/plugin-commonjs'
import {nodeResolve} from '@rollup/plugin-node-resolve'
import strip from '@rollup/plugin-strip'
import copy from 'rollup-plugin-copy'

export default [{
    input: 'src/entry.js',
    output: {
        file: 'dist/couch.js',
        format: 'esm',
        sourcemap: true
    },
    plugins: [
        commonjs(),
        nodeResolve(),
        strip({
            include: ['**/*.(js|mjs|ts|tsx)'],
            debugger: true,
            functions: ['console.log', 'console.debug'],
            sourceMap: true
        }),
        copy({
            targets: [
                {
                    src: ['../out/wasm/couch.wasm', 'src/couch.d.ts'],
                    dest: 'dist'
                }
            ]
        })
    ]
}
]

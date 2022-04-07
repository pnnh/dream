import {defineConfig} from 'vite'
import * as path from 'path'
//import { viteCommonjs } from '@originjs/vite-plugin-commonjs'
//import commonjs from '@rollup/plugin-commonjs'

export default defineConfig({
    base: "/",
    plugins: [
    ],
    build: {
        emptyOutDir: true,
        outDir: 'dist',
        rollupOptions: {
            input: ['index.html'],
            output: {
            }
        }
    },
    resolve: {
        alias: [
            {find: '/', replacement: path.resolve(__dirname, '.')},
        ]
    },
    publicDir: 'public'
})


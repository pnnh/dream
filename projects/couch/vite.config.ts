import {defineConfig} from 'vite'
import * as path from 'path'


const config = defineConfig(({command, mode}) => {
    return {
        base: "/",
        build: {
            emptyOutDir: true,
            outDir: 'dist',
            rollupOptions: {
                input: ['index.html'],
                output: {
                    format: 'es',
                    entryFileNames: (chunkInfo) => {
                        if (!chunkInfo.facadeModuleId) {
                            throw new Error('entryFileNames facadeModuleId为空')
                        }
                        const baseName = path.basename(chunkInfo.facadeModuleId)
                        const extName = path.extname(baseName)
                        console.debug('entryFileNames', chunkInfo.facadeModuleId, baseName)
                        const fileName = baseName.replace(extName, '.js')
                        return fileName
                    },
                    assetFileNames: (chunkInfo) => {
                        if (!chunkInfo.name) {
                            throw new Error('assetFileNames name为空')
                        }
                        const baseName = path.basename(chunkInfo.name)
                        const extName = path.extname(baseName)
                        console.debug('assetFileNames', chunkInfo.name, baseName)
                        if (extName === ".ttf") {
                            return 'fonts/' + baseName
                        }
                        if (extName === ".wasm") {
                            return 'wasm/' + baseName
                        }
                        return baseName
                    }
                }
            }
        },
        resolve: {
            alias: [
                {find: '@', replacement: path.resolve(__dirname, 'src')},
                {find: '~', replacement: path.resolve(__dirname, 'node_modules')}
            ]
        },
        publicDir: 'public'
    }
})

export default config
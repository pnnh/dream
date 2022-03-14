import {defineConfig} from 'vite'
import path from 'path'


const config = defineConfig(({command, mode}) => {
    return {
        base: "/assets/",
        build: {
            emptyOutDir: true,
            outDir: 'web/assets',
            rollupOptions: {
                input: ['src/index.tsx', 'src/index.scss'],
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
                        if (chunkInfo.name.startsWith(__dirname)) {

                            const assetName = chunkInfo.name.replace(__dirname + "/", "")
                            console.debug('assetFileNames==', chunkInfo.name, baseName, assetName, __dirname)
                            return assetName
                        }
                        console.debug('assetFileNames', chunkInfo.name, baseName)
                        return baseName
                    },
                    manualChunks(id) {
                        // 每个npm包一个chunk
                        if (id.includes('node_modules')) {
                            const idArray = id.split('/')
                            const index = idArray.indexOf('node_modules')
                            if (idArray.length > index + 1) {
                                return idArray[index + 1]
                            }
                        }
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

import {defineConfig} from 'vite'
import path from 'path'


const config = defineConfig(({command, mode}) => {
    return {
        base: "/dist/",
        build: {
            emptyOutDir: true,
            outDir: 'web/dist',
            rollupOptions: {
                input: ['index.js'],
                output: {
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

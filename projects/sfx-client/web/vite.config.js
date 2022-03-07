import {defineConfig} from 'vite'
import path from 'path'


const config = defineConfig(({command, mode}) => {
  let inputFiles = ['src/index.js']
  let baseUrl = "/dist/"

  if (mode === 'development') {
    baseUrl = "/"
    inputFiles = ['index.html']
  }

  return {
    base: baseUrl,
    server: {
      hmr: true,
      fs: {
        allow: ['../..']
      }
    },
    build: {
      emptyOutDir: true,
      outDir: 'dist',
      rollupOptions: {
        input: inputFiles,
        output: {
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
            console.debug('assetFileNames', chunkInfo.name, baseName, extName)
            return baseName
          },
          dir: path.resolve(__dirname, 'dist'),
          format: 'esm',
          manualChunks (id) {
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

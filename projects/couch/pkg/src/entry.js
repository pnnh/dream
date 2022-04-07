
// window.Module = { hello: "world" };
//
// import * as aaa from '/cmake-build-webassembly/couch';
//
// Module["noInitialRun"] = true;
//
// Module.locateFile = function (path: string, prefix: string) {
//     console.log('locateFile', path, prefix)
//     return prefix + path
// }
//
// console.log('aaa: ', aaa, Module);
//
// export {aaa};
import * as Couch from '../../cmake-build-webassembly/couch'
//
console.log('aaabbb: ',  Couch);

// const couch = Couch();
//
// console.log('bbb: ',  couch);

export async function runCouch(url) {

    return Couch.default({
        locateFile: (path, prefix) => {

            // const importMeta = (import.meta as any).env as viteEnv
            // let jsEnv = ''
            //
            // if (importMeta.DEV) {

            console.log('locateFile', path, prefix)
            console.log('locateFile2', url)
            // if (import.meta.env.DEV) {
            //     return "dist/couch.wasm"
            // }
            if (url) {
                return url
            }
            return prefix + path
        }
    })

}

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
import * as Couch from './public/couch'
//
console.log('aaa: ',  Couch);

// const couch = Couch();
//
// console.log('bbb: ',  couch);

Couch.default({
    locateFile: (path, prefix) => {

        // const importMeta = (import.meta as any).env as viteEnv
        // let jsEnv = ''
        //
        // if (importMeta.DEV) {

        console.log('locateFile', path, prefix)
        if (import.meta.env.DEV) {
            return "dist/couch.wasm"
        }
        return prefix + path
    }
}).then(function(couch) {
    console.log('ccc: ',  couch, couch.compareBig);
});




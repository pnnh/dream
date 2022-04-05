
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
import * as lib from './webassembly/couch'

export default lib;

// import {Couch } from './webassembly/couch'
// // const mymod = Module();
// // const int_sqrt = mymod.cwrap('int_sqrt', 'number', ['number']);
// // console.log(int_sqrt(64));
//
// console.log('bbb: ', Couch);
import {runCouch} from 'couch_bg';
import wasmUrl from 'couch_bg/dist/couch.wasm?url'

console.log("wasmUrl", wasmUrl)

runCouch(wasmUrl).then(function(couch) {
    console.log('ccc: ',  couch, couch.compareBig);
    console.log('ddd: ', couch.compareBig(100, 30));
});

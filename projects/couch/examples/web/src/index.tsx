import React, { useState } from 'react'
import ReactDOM from 'react-dom'
import {runCouch} from 'couch_bg';
import wasmUrl from 'couch_bg/dist/couch.wasm?url'

console.log("wasmUrl", wasmUrl)

const wasmPromise = runCouch(wasmUrl)


function DevApp () {
    const [markdown, setMarkdown] = useState<string>("")
    const [preview, setPreview] = useState<string>("")
    return <div className={'main'}>
        <div className={"top"}>
            <textarea className={"markdown"} value={markdown}
                      onChange={(event) => {
                          const markdown = event.target.value
                          console.debug("onChange: ", markdown)
                          setMarkdown(markdown)

                          wasmPromise.then(function(couch) {
                              //console.log('ccc: ',  couch, couch.compareBig);
                              console.log('ddd: ', couch.compareBig(100, 30));
                              const preview = couch.tryMarkdown2Json(markdown)
                              console.debug("preview: \n", preview)
                              setPreview(preview)
                          });
                      }}>
            </textarea>
        </div>
        <div className={"bottom"}>
            <pre>
            {preview}
            </pre>
        </div>
    </div>
}

ReactDOM.render(<DevApp />, document.getElementById('root'))

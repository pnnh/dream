/* tslint:disable */
/* eslint-disable */
/**
*/
export function init_console_error_panic_hook(): void;
/**
* @param {string} name
* @returns {string}
*/
export function greet(name: string): string;
/**
* @param {string} original
* @returns {string}
*/
export function excited_greeting(original: string): string;
/**
* @param {number} length
* @returns {number}
*/
export function random_greeting(length: number): number;
/**
* @param {number} length
* @param {boolean} has_number
* @param {boolean} has_letter
* @param {boolean} has_uppercase
* @param {boolean} has_symbol
* @returns {string}
*/
export function random_string(length: number, has_number: boolean, has_letter: boolean, has_uppercase: boolean, has_symbol: boolean): string;

export type InitInput = RequestInfo | URL | Response | BufferSource | WebAssembly.Module;

export interface InitOutput {
  readonly memory: WebAssembly.Memory;
  readonly init_console_error_panic_hook: () => void;
  readonly greet: (a: number, b: number, c: number) => void;
  readonly excited_greeting: (a: number, b: number, c: number) => void;
  readonly random_greeting: (a: number) => number;
  readonly random_string: (a: number, b: number, c: number, d: number, e: number, f: number) => void;
  readonly post_image: (a: number, b: number) => number;
  readonly __wbindgen_add_to_stack_pointer: (a: number) => number;
  readonly __wbindgen_malloc: (a: number) => number;
  readonly __wbindgen_realloc: (a: number, b: number, c: number) => number;
  readonly __wbindgen_free: (a: number, b: number) => void;
  readonly __wbindgen_exn_store: (a: number) => void;
}

/**
* If `module_or_path` is {RequestInfo} or {URL}, makes a request and
* for everything else, calls `WebAssembly.instantiate` directly.
*
* @param {InitInput | Promise<InitInput>} module_or_path
*
* @returns {Promise<InitOutput>}
*/
export default function init (module_or_path?: InitInput | Promise<InitInput>): Promise<InitOutput>;

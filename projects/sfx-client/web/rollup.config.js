import commonjs from '@rollup/plugin-commonjs';
import { nodeResolve } from '@rollup/plugin-node-resolve';
import { visualizer } from 'rollup-plugin-visualizer';

export default {
  input: 'src/entry.js',
  output: {
    file: "bundle.js",
    format: "esm"
  },
  plugins: [
    commonjs(),
    nodeResolve(),
    visualizer({
      filename: 'dist/status.html'
    })
  ]
}

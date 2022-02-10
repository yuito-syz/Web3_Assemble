module.exports = {
  preset: '@vue/cli-plugin-unit-jest/presets/typescript-and-babel',
  transform: {
    '^.+\\.vue$': 'vue-jest'
  },
  globals: {
    __PATH_PREFIX__: "",
    'ts-jest': {
      diagnostics: false
    }
  }
}

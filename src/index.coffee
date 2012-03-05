sysPath = require 'path'
uglify = require 'uglify-js'
{gen_code, ast_squeeze, ast_mangle} = uglify.uglify
{parse} = uglify.parser

module.exports = class UglifyMinifier
  minifierType: 'javascript'

  constructor: (@config) ->
    null

  minify: (data, path, callback) ->
    try
      minified = gen_code ast_squeeze ast_mangle parse data
    catch err
      error = "JS minify failed on #{file.path}: #{error}"
    process.nextTick ->
      callback error, (minified or data)

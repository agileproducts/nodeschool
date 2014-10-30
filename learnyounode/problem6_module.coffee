fs = require('fs')
path = require('path')

module.exports = (directory, extension, callback) ->
  fs.readdir directory, (err, list) ->
    if (err)
      return callback(err, null)
    else
      files = list.filter (f) -> path.extname(f) == ".#{extension}"
      callback(null, files)


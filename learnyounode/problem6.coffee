fileutils = require('./problem6_module')

directory = process.argv[2]
extension = process.argv[3]

fileutils directory, extension, (err,files) ->
  if err
    console.log(err)
  else
    for file in files
      console.log(file) 


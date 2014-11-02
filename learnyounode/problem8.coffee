http = require('http')
concatStream = require('concat-stream')

url = process.argv[2]

http.get url, (response) ->
  response.pipe concatStream (data) -> 
    data = data.toString()
    console.log data.length
    console.log data

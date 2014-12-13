#Write an HTTP server that serves the same text file for each request it receives.

#Your server should listen on the port provided by the first argument to your program.

#You will be provided with the location of the file to serve as the second command-line argument. You must use the fs.createReadStream() method to stream the file contents to the response.



http = require 'http'
fs = require 'fs'

port = process.argv[2]
file = process.argv[3]

server = http.createServer (request, response) ->
  input = fs.createReadStream(file)
  input.pipe response

server.listen port


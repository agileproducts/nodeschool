#Write an HTTP server that receives only POST requests and converts incoming POST body characters to upper-case and returns it to the client.

#Your server should listen on the port provided by the first argument to your program.

http = require 'http'
map = require 'through2-map'

port = process.argv[2]

server = http.createServer (request,response) ->
  bob = request.pipe map (chunk) ->
    chunk.toString().toUpperCase() #JS methods need parentheses
  .pipe response

server.listen port
###

Write an HTTP server that serves JSON data when it receives a GET request to the path '/api/parsetime'. Expect the request to contain a query string with a key 'iso' and an ISO-format time as the value.

For example:

  /api/parsetime?iso=2013-08-10T12:10:15.474Z

The JSON response should contain only 'hour', 'minute' and 'second' properties. For example:

    {
      "hour": 14,
      "minute": 23,
      "second": 15
    }

date.getFullYear()
    date.getMonth()     // starts at 0
    date.getDate()      // returns the day of month
    date.getHours()
    date.getMinutes()

Add second endpoint for the path '/api/unixtime' which accepts the same query string but returns UNIX epoch time under the property 'unixtime'. For example:

    { "unixtime": 1376136615474 }

Your server should listen on the port provided by the first argument to your program.

###

http = require 'http'
url = require 'url'

port = process.argv[2]

server = http.createServer (request,response) ->
  urlbits= url.parse(request.url, true)
  path = urlbits.pathname
  query = urlbits.query 
  switch path
    when "/api/parsetime"
      response.writeHead 200, { 'Content-Type': 'application/json' }
      iso = new Date(query["iso"])
      date = { hour:iso.getHours(), minute:iso.getMinutes(), second:iso.getSeconds() }
      response.end JSON.stringify(date)
    when "/api/unixtime"
      response.writeHead 200, { 'Content-Type': 'application/json' }
      iso = new Date(query["iso"])
      date = { unixtime:iso.getTime() }
      response.end JSON.stringify(date)
    else
      response.writeHead 404
      response.end "That's a 404"

server.listen port
###
This problem is the same as the previous problem (HTTP COLLECT) in that you need to use http.get(). However, this time you will be provided with three URLs as the first three command-line arguments.

You must collect the complete content provided to you by each of the URLs and print it to the console (stdout). You don't need to print out the length, just the data as a String; one line per URL. The catch is that you must print them out in the same order as the URLs are provided to you as command-line arguments.
###

http = require('http')
concatStream = require('concat-stream')

urls = [process.argv[2], process.argv[3], process.argv[4]]
count = 0
results = {}

urls.forEach (url) ->
  do (url) ->
    http.get url, (response) ->
      response.pipe concatStream (data) ->
        results[url] = data.toString()
        count++
        if count == urls.length
          urls.forEach (url)->
            console.log results[url]

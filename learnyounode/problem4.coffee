###
Write a program that uses a single asynchronous filesystem operation to read a file and print the number of newlines it contains to the console (stdout), similar to running cat file | wc -l.

The full path to the file to read will be provided as the first command-line argument.

###

fs = require('fs')

print_line_count = (input) ->
  fs.readFile input,"utf8", (err, fileContents) ->
    string = fileContents
    array = string.split("\n")
    console.log(array.length-1)

print_line_count(process.argv[2])

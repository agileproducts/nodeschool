###
Write a program that uses a single synchronous filesystem operation to read a file and print the number of newlines it contains to the console (stdout), similar to running cat file | wc -l.

The full path to the file to read will be provided as the first command-line argument.
###

lib_fs = require('fs')
buffer = lib_fs.readFileSync(process.argv[2])
string = buffer.toString()
array = string.split("\n")
console.log(array.length-1)
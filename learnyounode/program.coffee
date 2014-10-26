filter_process_variables = (array) ->
  array[2..].map (i) -> Number(i)

get_sum = (array) ->
  array.reduce (term, sum) -> term + sum

my_args = filter_process_variables(process.argv)
the_sum = get_sum(my_args)
console.log(the_sum)


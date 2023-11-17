#> str-splitter:impl/spliterator/split
#
#   >   Split the string using the start and end indexes of the found delimiter character
#
#@within function str-splitter:impl/spliterator/loop


#   Split the string and use the last string as the new input string
$data modify storage str-splitter:io root.output append string storage str-splitter:temp root.input 0 $(start_index)

$data modify storage str-splitter:temp root.input set string storage str-splitter:temp root.input $(end_index)


#   Indicate that the string has been split
scoreboard players add #splits str-splitter 1


#   Reset the length of the string to accomodate for the new input string
execute store result score #input.length str-splitter run data get storage str-splitter:temp root.input


#   If the splitting limit hasn't been reached, continue spliterating the new input string
execute if score #splits str-splitter < #input.split_limit str-splitter run function str-splitter:impl/spliterator/refresh


#   Otherwise, stop
execute if score #splits str-splitter >= #input.split_limit str-splitter run function str-splitter:impl/spliterator/end

#> str-splitter:impl/spliterator/compute/result
#
#   >   Split the string using the start and end indexes of the found delimiter string
#
#@within function str-splitter:impl/spliterator/loop


#   Split the string based from the start and end indexes of the delimiter string
$execute if score #delimiter.actual_length str-splitter matches 1.. run data modify storage str-splitter:io root.output append string storage str-splitter:temp root.input 0 $(start_index)

execute if score #delimiter.actual_length str-splitter matches ..0 run data modify storage str-splitter:io root.output append string storage str-splitter:temp root.input 0 1


#   Use the remaining string as the new input string
$data modify storage str-splitter:temp root.input set string storage str-splitter:temp root.input $(end_index)


#   Indicate that the string has been split
scoreboard players add #input.splits str-splitter 1

execute store result score #input.length str-splitter run data get storage str-splitter:temp root.input


#   If the splitting limit hasn't been reached, continue spliterating the new input string
execute if predicate str-splitter:should_continue_splitting run scoreboard players set #index.start str-splitter -1


#   Otherwise, stop
execute if predicate str-splitter:should_stop_splitting run scoreboard players operation #index.start str-splitter = #input.length str-splitter

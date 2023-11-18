#> str-splitter:impl/spliterator/compute/index
#
#   >   Compute the start and end indexes used for iterating through each character of a string
#       (which is then used for searching for delimiters)
#
#@within function str-splitter:impl/**


#   Compute the start and end indexes
scoreboard players add #index.start str-splitter 1

scoreboard players operation #index.end str-splitter = #index.start str-splitter

scoreboard players operation #index.end str-splitter += #delimiter.length str-splitter


#   Store the computed indexes to the temporary storage
execute store result storage str-splitter:temp root.start_index int 1 run scoreboard players get #index.start str-splitter

execute store result storage str-splitter:temp root.end_index int 1 run scoreboard players get #index.end str-splitter

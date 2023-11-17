#> str-splitter:impl/spliterator/loop
#
#   >   Iterate through each of the specified string in the `root.input` NBT path of the `str-splitter:io` storage.
#
#@within
#   function str-splitter:start
#   function str-splitter:impl/spliterator/loop


#   Get the character between the start and end indexes
$data modify storage str-splitter:temp root.char set string storage str-splitter:temp root.input $(start_index) $(end_index)


#   Check if the current character is the specified delimiter
data modify storage str-splitter:temp root.delimiter set from storage str-splitter:main root.delimiter

execute store success score #shouldnt_split str-splitter run data modify storage str-splitter:temp root.delimiter set from storage str-splitter:temp root.char


#   If the current character is the specified delimiter, split the string
execute if score #shouldnt_split str-splitter matches 0 run function str-splitter:impl/spliterator/split with storage str-splitter:temp root


#   Increment the start and end indexes
scoreboard players add #index.start str-splitter 1

scoreboard players add #index.end str-splitter 1

execute store result storage str-splitter:temp root.start_index int 1 run scoreboard players get #index.start str-splitter

execute store result storage str-splitter:temp root.end_index int 1 run scoreboard players get #index.end str-splitter


#   If the start index is equal or greater than the specified string's length, append the remaining string to the output path
execute if score #index.start str-splitter >= #input.length str-splitter run data modify storage str-splitter:io root.output append from storage str-splitter:temp root.input


#   Recursively call this function until the start index is no longer less than the specified string's length
execute if score #index.start str-splitter < #input.length str-splitter run function str-splitter:impl/spliterator/loop with storage str-splitter:temp root

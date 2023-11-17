#> str-splitter:start
#
#   >   Start splitting the specified string in the `root.input` NBT path of the `str-splitter:io` storage.
#
#@public


#   Get the length of the identifier string and the specified split limit
execute store result score #input.length str-splitter run data get storage str-splitter:io root.input

execute store result score #input.split_limit str-splitter run data get storage str-splitter:main root.limit


#   Reset flags that are used for processing strings
scoreboard players set #splits str-splitter 0

data remove storage str-splitter:io root.output

data remove storage str-splitter:temp root


#   Initialize the index values
scoreboard players set #index.start str-splitter 0

scoreboard players set #index.end str-splitter 1

execute store result storage str-splitter:temp root.start_index int 1 run scoreboard players get #index.start str-splitter

execute store result storage str-splitter:temp root.end_index int 1 run scoreboard players get #index.end str-splitter


#   Copy the input string to a temporary storage
data modify storage str-splitter:temp root.input set from storage str-splitter:io root.input


#   If the input string is not empty and if the specified split limit is greater than 0, iterate through each of its characters
execute if score #input.split_limit str-splitter matches 1.. if score #input.length str-splitter matches 1.. run function str-splitter:impl/spliterator/loop with storage str-splitter:temp root


#   If the specified split limit is less than 1, just copy the input string to the output path
execute if score #input.split_limit str-splitter matches ..0 run data modify storage str-splitter:io root.output append from storage str-splitter:temp root.input

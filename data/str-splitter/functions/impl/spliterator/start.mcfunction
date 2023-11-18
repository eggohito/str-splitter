#> str-splitter:impl/spliterator/start
#
#   >   Start splitting the specified string in the `root.input` NBT path of the `str-splitter:io` storage.
#
#@within tag/function str-splitter:start


#   Reset variables that are used for processing strings
scoreboard players set #index.start str-splitter -1

scoreboard players set #input.splits str-splitter 0

data remove storage str-splitter:io root.output

data remove storage str-splitter:temp root


#   Store the input string and config flags to a temporary storage
data modify storage str-splitter:temp root.input set from storage str-splitter:io root.input

data modify storage str-splitter:temp root.delimiter set from storage str-splitter:main root.delimiter


#   Get the length of the input string and the limit of splitting strings
execute store result score #input.length str-splitter run data get storage str-splitter:io root.input

execute store result score #input.split_limit str-splitter run data get storage str-splitter:main root.limit


#   Get the actual length of the delimiter and the capped length (w/ min value of 1) of the delimiter
execute store result score #delimiter.actual_length str-splitter run data get storage str-splitter:temp root.delimiter

scoreboard players operation #delimiter.length str-splitter = #delimiter.actual_length str-splitter

scoreboard players operation #delimiter.length str-splitter > #1 str-splitter


#   Compute the indexes
function str-splitter:impl/spliterator/compute/index


#   If the input string is not empty and if the specified split limit is greater than 0, iterate through each of its characters
execute if predicate str-splitter:can_split run function str-splitter:impl/spliterator/loop with storage str-splitter:temp root


#   If the specified split limit is 0, just copy the input string to the output path
execute unless predicate str-splitter:can_split run data modify storage str-splitter:io root.output append from storage str-splitter:temp root.input

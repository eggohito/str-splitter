#> str-splitter:impl/spliterator/loop
#
#   >   Iterate through each of the specified string in the `root.input` NBT path of the `str-splitter:io` storage.
#
#@within
#   function str-splitter:impl/spliterator/start
#   function str-splitter:impl/spliterator/loop


#   Get the character between the start and end indexes
$data modify storage str-splitter:temp root.current_string set string storage str-splitter:temp root.input $(start_index) $(end_index)


#   Check if the current character is the specified delimiter
data modify storage str-splitter:temp root.matcher set from storage str-splitter:temp root.delimiter

execute store success score #delimiter.not_found str-splitter run data modify storage str-splitter:temp root.matcher set from storage str-splitter:temp root.current_string


#   If the current character is the specified delimiter, split the string
execute if predicate str-splitter:should_split run function str-splitter:impl/spliterator/compute/result with storage str-splitter:temp root


#   Increment the start and end indexes
function str-splitter:impl/spliterator/compute/index


#   If the start index is equal or greater than the specified string's length, append the remaining string to the output path
execute if score #index.start str-splitter >= #input.length str-splitter run data modify storage str-splitter:io root.output append from storage str-splitter:temp root.input


#   Recursively call this function until the start index is no longer less than the specified string's length
execute if score #index.start str-splitter < #input.length str-splitter run function str-splitter:impl/spliterator/loop with storage str-splitter:temp root

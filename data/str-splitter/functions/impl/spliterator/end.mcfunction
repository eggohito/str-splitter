#> str-splitter:impl/spliterator/end
#
#   >   Set the start and end indexes of the iterator
#
#@within function str-splitter:impl/spliterator/split


#   Set the start and end indexes as the input string's length
scoreboard players operation #index.start str-splitter = #input.length str-splitter

scoreboard players operation #index.end str-splitter = #input.length str-splitter


#   Offset the start index by 1
scoreboard players remove #index.start str-splitter 1

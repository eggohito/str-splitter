#> str-splitter:impl/spliterator/refresh
#
#   >   Reset the start and end indexes of the iterator
#
#@within function str-splitter:impl/spliterator/split


#   Reset the start and end indexes to its initial values (offset by 1)
scoreboard players set #index.start str-splitter -1

scoreboard players set #index.end str-splitter 0

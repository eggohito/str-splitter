#> str-splitter:private/load
#
#@within tag/function minecraft:load

#>  
#
#   #### Command storages used for splitting strings.
#
#   * `str-splitter:main` - contains configurable flags used for splitting strings.
#   * `str-splitter:temp` - used for temporarily storing strings when splitting.
#   * `str-splitter:io`   - used for input and output.
#
#@public
    #declare storage str-splitter:main
    #declare storage str-splitter:temp
    #declare storage str-splitter:io


#   Add scoreboard objectives
scoreboard objectives add str-splitter dummy


#   Initialize a default separator for strings
execute unless score #loaded str-splitter = #loaded str-splitter run data modify storage str-splitter:main root.delimiter set value ":"

execute unless score #loaded str-splitter = #loaded str-splitter run data modify storage str-splitter:main root.limit set value 1


scoreboard players set #loaded str-splitter 1

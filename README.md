#   String Splitter

A data pack library for splitting strings according to the specified delimiter for Minecraft 1.20.2 and above.


##  Customizing

This data pack library provides two configurable NBTs in the `str-splitter:main` command storage used for splitting strings.

NBT Path            | Default Value | Description
--------------------|---------------|------------
`root.delimiter`    | `":"`         | Determines which character the input string should be split by. **Currently only supports single characters**.
`root.limit`        | `1`           | Determines how many times the input string should be split. If set to `-1` or lower, there will be no limit on how many times the input string should be split.
<br>

**e.g**:
```mcfunction
#   Split strings by the `.` character
data modify storage str-splitter:main root.delimiter set value "."


#   Split strings only 2 times
data modify storage str-splitter:main root.limit set value 2
```

##  How to Use

1. Specify a string in the `root.input` NBT of the `str-splitter:io` command storage:
```mcfunction
#   Example: "minecraft:dirt" will be the identifier string to be split, assuming that the delimiter hasn't been changed
data modify storage str-splitter:io root.input set value "minecraft:dirt"
```
<br>

2. Call the `str-splitter:start` function to start the process of splitting the specified string in the `root.input` NBT of the `str-splitter:io` command storage:
```mcfunction
function str-splitter:start
```
<br>

3. The result of the splitting process will be stored in the `root.output` NBT of the `str-splitter:io` command storage, which will be an array of strings:
```mcfunction
#   Example: display the namespace and path from "minecraft:dirt"
tellraw @a ["Namespace: \"", {"storage": "str-splitter:io", "nbt": "root.output[0]"}, "\""]

tellraw @a ["Path: \"", {"storage": "str-splitter:io", "nbt": "root.output[1]"}, "\""]


#   The output should be:
#
#   Namespace: "minecraft"
#   Path: "dirt"

```

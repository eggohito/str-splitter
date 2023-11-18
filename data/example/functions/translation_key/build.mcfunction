#> example:translation_key/build
#declare storage example:translation_key


#   Split the string specified in the `root.input` NBT path of the `str-splitter:io` storage
function #str-splitter:start


#   Store the split output into the `namespace` and `path` NBT paths of the `root` NBT compound of the `example:translation_key` storage
data modify storage example:translation_key root.namespace set from storage str-splitter:io root.output[0]

data modify storage example:translation_key root.path set from storage str-splitter:io root.output[1]

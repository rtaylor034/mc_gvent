#> gvent:api > call
#--------------------
# -> event: mstring<function>
# => info: obj = {}
# => pass: obj(a) = {}
#--------------------
# <- pass: obj(a)
#--------------------
#> calls <event> with given <info> and starting <pass> values.
#--------------------
# ...
#--------------------
# ...
#--------------------

#declare storage gvent:var
#declare storage gvent:in
#declare storage gvent:out
#declare storage gvent:dirty

$data modify storage gvent:in call set value $(in)
execute unless data storage gvent:in call.info run data modify storage gvent:in call.info set value {}
execute unless data storage gvent:in call.pass run data modify storage gvent:in call.pass set value {}

data modify storage gvent:dirty call.pass_stack append from storage gvent:in call.pass
data modify storage gvent:var call.macro.info set from storage gvent:in call.info
data modify storage gvent:var call.macro.pass set value "gvent:dirty call.pass_stack[-1]"

function gvent:impl/call/do with storage gvent:in call

data modify storage gvent:out call.pass set from storage gvent:dirty call.pass_stack[-1]
data remove storage gvent:dirty call.pass_stack[-1]

data remove storage gvent:in call
data remove storage gvent:var call
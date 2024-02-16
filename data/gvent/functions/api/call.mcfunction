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

data modify storage gvent:dirty call.stack append from storage gvent:in call
data remove storage gvent:in call

execute unless data storage gvent:dirty call.stack[-1].info run data modify storage gvent:dirty call.stack[-1].info set value {}
execute unless data storage gvent:dirty call.stack[-1].pass run data modify storage gvent:dirty call.stack[-1].pass set value {}

data modify storage gvent:var call.with.info set from storage gvent:dirty call.stack[-1].info
data modify storage gvent:var call.with.pass set value "gvent:dirty call.stack[-1].pass"
function gvent:impl/call/do with storage gvent:dirty call.stack[-1]

data modify storage gvent:out call.pass set from storage gvent:dirty call.stack[-1].pass
data remove storage gvent:dirty call.stack[-1]

data remove storage gvent:var call
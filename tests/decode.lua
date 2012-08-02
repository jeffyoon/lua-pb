
local pb = require"pb"

if #arg < 3 then
	print("Usage: " .. arg[0] .. " <proto definition> <message type> <protobuf encoded message file>")
	return
end

local proto = require(arg[1])
local msg = proto[arg[2]]()

local f = assert(io.open(arg[3]))
local bin = assert(f:read('*a'))
assert(f:close())

local off
msg, off = msg:Parse(bin)

pb.print(msg)


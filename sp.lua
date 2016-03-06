-- created by mzq. -*- mode: lua -*-

local sprotoloader = require "sprotoloader"

local sp = {}

function sp.save(name, bin)
	if bin then
		local file = io.open(name)
		sprotoloader.save(file:read("a"), 1)
		file:close()
	else
		sprotoloader.register(name, 1)
	end
end

function sp.load()
	local sproto = sprotoloader.load(1)
	local host = sproto:host()
	sp.pack = host:attach(sproto)
	sp.unpack = function(...) return host:dispatch(...) end
end

return sp

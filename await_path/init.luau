local fs = require("@lune/fs")
local task = require("@lune/task")

local function await_path(paths: string | { string }, timeout: number?)
	if typeof(paths) ~= "table" then paths = { paths } end
	timeout = timeout or math.huge

	local accumulated_time = 0
	while true do
		local is_done = true
		for _, path in paths do
			if fs.isDir(path) or fs.isFile(path) then continue end
			is_done = false
		end
		if is_done then
			return true
		else
			accumulated_time += task.wait()
			if accumulated_time >= timeout then return false end
		end
	end
end

return await_path

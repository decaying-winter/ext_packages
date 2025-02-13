local async = require("../async")
local fs = require("@lune/fs")
local task = require("@lune/task")

local function await_path(paths: string | { string }, timeout: number?)
	if typeof(paths) ~= "table" then paths = { paths } end

	local waiters = {}

	for _, path in paths :: { string } do
		table.insert(
			waiters,
			task.spawn(function()
				while true do
					if fs.isDir(path) then break end
					task.wait()
				end
			end)
		)
	end

	async(waiters, timeout)
end

return await_path

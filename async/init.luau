local task = require("@lune/task")

local function async(threads: thread | { thread })
	if typeof(threads) == "table" then
		for _, thread in threads do
			async(thread)
		end
	else
		while true do
			if coroutine.status(threads) == "dead" then
				break
			end
			task.wait()
		end
	end
end

return async

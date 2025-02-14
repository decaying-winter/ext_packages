local task = require("@lune/task")

local await = function(threads: thread | { thread }, timeout: number?)
	if typeof(threads) ~= "table" then threads = { threads } end
	timeout = timeout or math.huge

	local accumulated_time = 0
	while true do
		local all_threads_done = true
		if accumulated_time >= timeout :: number then return false end
		for _, thread in threads :: { thread } do
			if coroutine.status(thread) ~= "dead" then
				all_threads_done = false
				break
			end
		end
		if all_threads_done then
			return true
		else
			accumulated_time += task.wait()
		end
	end
end

return await

local task = require("@lune/task")

return function(...: thread)
	local threads = { ... }
	while true do
		task.wait()
		for _, thread in threads do
			if coroutine.status(thread) ~= "dead" then
				continue
			end
		end
		break
	end
end

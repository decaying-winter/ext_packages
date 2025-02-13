local process = require("@lune/process")
local task = require("@lune/task")

return function(processName: string, parameters: { string }, env: _env?): thread
	return task.spawn(process.spawn, processName, parameters, {
		env = env,
		stdio = "forward" :: "forward",
	})
end

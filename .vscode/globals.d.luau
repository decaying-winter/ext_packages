export type run_target = "test"|"ext"|"game"

export type _env = {
	[any]: any,
	run_target: run_target
}

declare getfenv: (target: any) -> (_env)
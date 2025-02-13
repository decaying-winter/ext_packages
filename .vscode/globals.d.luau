export type target_env = "test"|"ext"|"game"

export type _env = {
	[string]: any,
	target: target_env
}

declare getfenv: (target: any) -> (_env)
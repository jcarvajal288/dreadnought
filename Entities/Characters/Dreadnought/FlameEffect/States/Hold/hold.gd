extends State

@export var release_state: State


func process_frame(_delta: float) -> State:
	if not director.flamethrower_toggled:
		return release_state
	else:
		return null
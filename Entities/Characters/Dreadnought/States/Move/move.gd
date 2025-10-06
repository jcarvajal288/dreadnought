extends State

@export var idle_state: State
@export var shoot_state: State
@export var flame_state: State


func process_frame(_delta: float) -> State:
	animation_player.set_facing(director.movement_vector)
	animation_player.play_with_facing(animation_name)
	if director.shooting_vector != Vector2.ZERO:
		if director.flamethrower_toggled:
			return flame_state
		else:
			return shoot_state
	elif director.movement_vector == Vector2.ZERO:
		return idle_state
	return null

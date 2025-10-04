extends State

@export var idle_state: State
@export var move_state: State


func process_frame(_delta: float) -> State:
	animation_player.play_eight_way(animation_name, director.shooting_vector)
	if director.shooting_vector == Vector2.ZERO:
		if director.movement_vector == Vector2.ZERO:
			return idle_state
		else:
			return move_state
	return null

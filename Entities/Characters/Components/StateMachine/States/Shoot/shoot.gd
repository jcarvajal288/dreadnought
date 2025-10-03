extends State

@export var idle_state: State
@export var move_state: State


func process_frame(_delta: float) -> State:
	if director.shooting_vector == Vector2.ZERO:
		if director.movement_vector == Vector2.ZERO:
			return idle_state
		else:
			return move_state
	return null
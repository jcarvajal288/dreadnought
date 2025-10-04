extends State

@export var idle_state: State


func process_frame(_delta: float) -> State:
	if director.movement_vector == Vector2.ZERO:
		return idle_state
	subject.velocity = director.movement_vector * subject.speed
	subject.move_and_slide()
	return null
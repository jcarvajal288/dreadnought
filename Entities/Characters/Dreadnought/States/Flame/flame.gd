extends State

@export var idle_state: State
@export var move_state: State
@export var shoot_state: State

signal flamethrower_fired

func enter() -> void:
	super()
	flamethrower_fired.emit(director.shooting_vector)


func exit() -> void:
	super()


func process_frame(_delta: float) -> State:
	animation_player.play_four_way(animation_name, director.shooting_vector)
	if director.shooting_vector == Vector2.ZERO:
		if director.movement_vector == Vector2.ZERO:
			return idle_state
		else:
			return move_state
	elif not director.flamethrower_toggled:
		return shoot_state
	return null

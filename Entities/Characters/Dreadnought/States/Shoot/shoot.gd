extends State

@export var idle_state: State
@export var move_state: State

signal shot_fired


func _ready() -> void:
	$Timer.timeout.connect(fire_shot)


func enter() -> void:
	super()
	$Timer.start()
	fire_shot()


func exit() -> void:
	super()
	$Timer.stop()


func process_frame(_delta: float) -> State:
	animation_player.play_eight_way(animation_name, director.shooting_vector)
	if director.shooting_vector == Vector2.ZERO:
		if director.movement_vector == Vector2.ZERO:
			return idle_state
		else:
			return move_state
	return null


func fire_shot() -> void:
	shot_fired.emit(director.shooting_vector)
	$AudioStreamPlayer2D.play()
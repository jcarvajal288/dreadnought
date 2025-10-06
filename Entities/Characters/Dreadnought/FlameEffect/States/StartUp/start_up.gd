extends State

@export var hold_state: State


func _ready() -> void:
	animation_player.animation_finished.connect(_on_animation_finished)


func _on_animation_finished(anim_name: String) -> void:
	if anim_name == "startUp":
		signal_state_change.emit(hold_state)
	
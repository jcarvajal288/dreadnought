extends State

@export var idle_state: State


func _on_animation_finished(anim_name: String) -> void:
	if anim_name == 'spawn':
		signal_state_change.emit(idle_state)

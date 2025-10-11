extends State


@export var idle_state: State

func enter() -> void:
	super()
	if not animation_player.animation_finished.is_connected(_on_animation_finished):
		animation_player.animation_finished.connect(_on_animation_finished)

func _on_animation_finished(anim_name: String) -> void:
	if anim_name.begins_with('attack'):
		signal_state_change.emit(idle_state)
extends State


func enter() -> void:
	super()
	subject.velocity = Vector2.ZERO
	director.movement_locked = true
	subject.hide_leg_sprite()
	if not animation_player.animation_finished.is_connected(_on_animation_finished):
		animation_player.animation_finished.connect(_on_animation_finished)


func _on_death() -> void:
	signal_state_change.emit(self)


func _on_animation_finished(anim_name: String) -> void:
	if anim_name == 'death':
		Global.game_over.emit()
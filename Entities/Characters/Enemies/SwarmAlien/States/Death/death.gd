extends State

# connect in editor to a Health's on_death signal
func _on_death() -> void:
	signal_state_change.emit(self)


func enter() -> void:
	super()
	subject.velocity = Vector2.ZERO
	$DeathSFX.play()


func _on_animation_finished(anim_name: String) -> void:
	if anim_name == 'death':
		queue_free()


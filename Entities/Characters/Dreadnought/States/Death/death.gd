extends State


func enter() -> void:
	super()
	subject.velocity = Vector2.ZERO
	director.movement_locked = true
	subject.hide_leg_sprite()


func _on_death() -> void:
	signal_state_change.emit(self)
extends State


func enter() -> void:
	super()
	subject.velocity = Vector2.ZERO


func _on_death() -> void:
	print("trigger")
	signal_state_change.emit(self)
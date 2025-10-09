extends State

@export var idle_state: State
@export var hurtbox: Hurtbox


func enter() -> void:
	super()
	if not animation_player.animation_finished.is_connected(_on_animation_finished):
		animation_player.animation_finished.connect(_on_animation_finished)


func _on_hit(area: Area2D) -> void:
	if area is Hitbox and not subject.health.is_dead():
		signal_state_change.emit(self)


func _on_animation_finished(anim_name: String) -> void:
	if anim_name.begins_with("damaged"):
		signal_state_change.emit(idle_state)

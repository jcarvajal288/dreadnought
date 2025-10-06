extends State

signal flame_over


func _ready() -> void:
	animation_player.animation_finished.connect(_on_animation_finished)


func _on_animation_finished(anim_name: String) -> void:
	if anim_name == "release":
		flame_over.emit()	

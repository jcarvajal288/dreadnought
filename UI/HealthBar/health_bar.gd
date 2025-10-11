extends Node2D


func _ready() -> void:
	$TextureProgressBar.value = 100
	Global.player_health_changed.connect(change_health)


func change_health(current_health: int, max_health: int) -> void:
	var new_percentage = float(current_health) / max_health * 100
	$TextureProgressBar.value = new_percentage


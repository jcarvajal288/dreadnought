extends Node

@export var game_over_screen_scene: PackedScene


func _ready() -> void:
	Global.game_over.connect(_on_game_over)


func _on_game_over() -> void:
	Global.is_game_over = true
	var game_over_screen = game_over_screen_scene.instantiate()
	add_child(game_over_screen)

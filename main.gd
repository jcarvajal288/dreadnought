extends Node

@export var end_screen_scene: PackedScene


func _ready() -> void:
	Global.game_over.connect(_on_game_over)
	Global.add_enemy.connect(_on_add_enemy)


func _process(_delta: float) -> void:
	if Global.NUM_SPAWNERS <= 0 and not Global.is_game_over:
		declare_victory()


func declare_victory() -> void:
	Global.is_game_over = true
	var victory_screen = end_screen_scene.instantiate()
	victory_screen.set_text("Victory!")
	add_child(victory_screen)


func _on_game_over() -> void:
	Global.is_game_over = true
	var game_over_screen = end_screen_scene.instantiate()
	game_over_screen.set_text("Game Over")
	add_child(game_over_screen)


func _on_add_enemy(enemy: Node):
	add_child(enemy)

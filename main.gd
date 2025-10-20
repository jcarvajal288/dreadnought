extends Node

@export var victory_screen_scene: PackedScene
@export var game_over_screen_scene: PackedScene


func _ready() -> void:
	Global.game_over.connect(_on_game_over)
	Global.add_enemy.connect(_on_add_enemy)


func _process(_delta: float) -> void:
	if Global.NUM_SPAWNERS <= 4:
		declare_victory()


func declare_victory() -> void:
	Global.is_game_over = true
	var victory_screen = victory_screen_scene.instantiate()
	add_child(victory_screen)


func _on_game_over() -> void:
	Global.is_game_over = true
	var game_over_screen = game_over_screen_scene.instantiate()
	add_child(game_over_screen)


func _on_add_enemy(enemy: Node):
	add_child(enemy)

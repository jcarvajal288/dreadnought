extends Node

var PLAYER_POSITION = Vector2.ZERO
var MAP_TILE_SIZE = 8.0
var NUM_SPAWNERS = 0

@onready var is_game_over = false

signal player_health_changed
signal add_enemy
signal game_over

enum RenderOrder {
	BASE = -2,
	FLOOR = 0,
	DOOR = 1,
	WALL = 2,
	PROP = 3,
	ENEMY = 4,
	PLAYER = 5,
	UI = 100,
}

enum CollisionLayer {
	WALLS = 1,
	PLAYER = 2,
	ENEMY = 3,
	BULLET = 4,
	FLOOR = 8,
}


enum KeyItem {
	NONE,
	RED,
	YELLOW,
	BLUE,
}
extends Node

var PLAYER_POSITION = Vector2.ZERO
var MAP_TILE_SIZE = 8.0

signal player_health_changed

enum RenderOrder {
	BASE = -2,
	FLOOR = 0,
	WALL = 1,
	PROP = 2,
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


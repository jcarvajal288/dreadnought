extends Director

@export var attack_range_pixels: int
@export var tile_distance_to_notice_player: int
@onready var sight_distance = Global.MAP_TILE_SIZE * tile_distance_to_notice_player


func _process(_delta: float) -> void:
	reset()
	var distance_to_player = subject.global_position.distance_to(Global.PLAYER_POSITION)
	if not distance_to_player <= sight_distance:
		movement_vector = Vector2.ZERO
	elif distance_to_player > attack_range_pixels:
		movement_vector = subject.global_position.direction_to(Global.PLAYER_POSITION)
	else:
		attack = true
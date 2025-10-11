class_name EnemySpawner extends Node2D


@export var enemy_dict: Dictionary[PackedScene, int]
@export var spawn_frequency: float


func _ready() -> void:
	$SpawnTimer.timeout.connect(spawn_enemy)
	$SpawnTimer.start(spawn_frequency)


func despawn() -> void: # connect to Health's on_death signal
	queue_free()


func spawn_enemy() -> void:
	var enemy_scene = choose_enemy()
	if enemy_scene == null:
		print("null enemy")
		return
	var spawn_position = choose_spawn_position()
	if spawn_position != Vector2.ZERO:
		var enemy = enemy_scene.instantiate()
		enemy.global_position = spawn_position
		get_tree().root.add_child(enemy)


func choose_enemy() -> PackedScene:
	var total_probability = enemy_dict.values().reduce(func(a, b): return a + b, 0)
	var choice = randi_range(0, total_probability)
	for enemy in enemy_dict:
		var probability = enemy_dict[enemy]
		if choice <= probability:
			return enemy
	return null


func choose_spawn_position() -> Vector2:
	var space_state = get_world_2d().direct_space_state
	for i in range(10): # 10 max attempts
		var radius = $Area2D/CollisionShape2D.shape.radius
		var center = $Area2D/CollisionShape2D.global_position
		var angle = randf_range(0.0, TAU)
		var distance = radius * sqrt(randf())
		var offset = Vector2(distance, 0).rotated(angle)
		var spawn_position = center + offset
		if is_point_free(spawn_position, space_state):
			return spawn_position
	return Vector2.ZERO


func is_point_free(point: Vector2, space_state: PhysicsDirectSpaceState2D) -> bool:
	var is_not_colliding = func() -> bool:
		var query = PhysicsPointQueryParameters2D.new()
		query.position = point
		query.collide_with_bodies = true
		query.collision_mask = Global.CollisionLayer.WALLS
		return space_state.intersect_point(query).is_empty()

	var is_on_map = func() -> bool:
		var query = PhysicsPointQueryParameters2D.new()
		query.position = point
		query.collide_with_bodies = true
		query.collision_mask = 128
		return not space_state.intersect_point(query).is_empty()

	return is_not_colliding.call() and is_on_map.call()

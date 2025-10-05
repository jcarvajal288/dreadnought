extends RigidBody2D

@export var bullet_impact_scene: PackedScene

var direction: Vector2
var speed = 400
var impact_interval = 0.03


func _ready() -> void:
	$Timer.start(impact_interval)
	$Timer.timeout.connect(spawn_bullet_impact)
	body_entered.connect(on_body_entered)


func set_velocity():
	linear_velocity = direction * speed


func spawn_bullet_impact() -> void:
	var impact = bullet_impact_scene.instantiate()
	impact.set_facing(direction)
	impact.global_position = global_position 
	get_tree().root.add_child(impact)


func on_body_entered(_body: Node2D) -> void:
	spawn_bullet_impact()
	queue_free()
extends RigidBody2D

@export var bullet_impact_scene: PackedScene

var direction: Vector2
var speed = 400
var impact_interval = 0.03
var startup_time = 0.125


func _ready() -> void:
	$StartupTimer.start(startup_time)
	$ImpactIntervalTimer.start(impact_interval)
	$ImpactIntervalTimer.timeout.connect(spawn_bullet_impact)
	body_entered.connect(on_body_entered)


func set_velocity():
	linear_velocity = direction * speed


func spawn_bullet_impact() -> void:
	if $StartupTimer.time_left > 0:
		return
	var impact = bullet_impact_scene.instantiate()
	impact.set_facing(direction)
	impact.global_position = global_position 
	get_tree().root.call_deferred("add_child", impact)


func on_body_entered(_body: Node2D) -> void:
	queue_free()
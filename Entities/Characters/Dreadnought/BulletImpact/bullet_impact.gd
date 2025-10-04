extends Node2D

var facing = "DownRight"

func _ready() -> void:
	$AnimatedSprite2D.play("impact" + facing)
	$AnimatedSprite2D.animation_finished.connect(clean_up)


func set_facing(direction: Vector2):
	if direction == Vector2.ZERO:
		return
	var leftRight = ""
	var upDown = ""
	if direction.x > 0:
		leftRight = "Right"
	elif direction.x < 0:
		leftRight = "Left"
	if direction.y > 0:
		upDown = "Down"
	elif direction.y < 0:
		upDown = "Up"
	facing = upDown + leftRight


func clean_up() -> void:
	queue_free()
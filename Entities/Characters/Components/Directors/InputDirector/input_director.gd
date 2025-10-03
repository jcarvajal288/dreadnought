class_name InputDirector extends Director

var movement_vector = Vector2.ZERO
var shooting_vector = Vector2.ZERO

@export var subject: CharacterBody2D


func reset() -> void:
	movement_vector = Vector2.ZERO


func _physics_process(_delta: float) -> void:
	movement_vector = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	shooting_vector = Input.get_vector("shoot_left", "shoot_right", "shoot_up", "shoot_down")
	run_legs()


func run_legs():
	subject.leg_animation_player.set_facing(movement_vector)
	if movement_vector == Vector2.ZERO:
		subject.leg_animation_player.play_with_facing("idle")
	else:
		subject.leg_animation_player.play_with_facing("move")
	subject.velocity = movement_vector * subject.speed
	subject.move_and_slide()
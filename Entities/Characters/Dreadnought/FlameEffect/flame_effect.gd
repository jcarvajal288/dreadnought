extends Node2D


func _ready() -> void:
	$AnimationPlayer.animation_finished.connect(change_animation)


func start(direction: Vector2) -> void:
	$AnimationPlayer.set_facing_4_way(direction)
	if $AnimationPlayer.facing.begins_with("Up"):
		z_index = Global.RenderOrder.PLAYER - 1
	else:
		z_index = Global.RenderOrder.PLAYER + 1
	$AnimationPlayer.play_with_facing("startUp")


func change_animation(anim_name: String) -> void:
	if anim_name.begins_with("startUp"):
		$AnimationPlayer.play_with_facing("hold")
	elif anim_name.begins_with("release"):
		queue_free()


func _process(_delta: float) -> void:
	var shooting_vector = Input.get_vector("shoot_left", "shoot_right", "shoot_up", "shoot_down")
	var flamethrower_toggled = Input.is_action_pressed("shoot_flame")
	var animation_name = $AnimationPlayer.current_animation.replace($AnimationPlayer.facing, "")
	$AnimationPlayer.set_facing_4_way(shooting_vector)
	$AnimationPlayer.play_with_facing(animation_name)
	if $AnimationPlayer.current_animation.begins_with("hold") and not flamethrower_toggled:
		$AnimationPlayer.play_with_facing("release")

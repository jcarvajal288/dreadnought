extends Node2D

var director: Director

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
	$AnimationPlayer.set_facing_4_way(director.shooting_vector)
	$AnimationPlayer.play_with_facing($AnimationPlayer.current_animation)
	if $AnimationPlayer.current_animation.begins_with("hold") and not director.flamethrower_toggled:
		$AnimationPlayer.play_with_facing("release")

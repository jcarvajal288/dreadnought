extends AnimationPlayer

var facing = "DownRight"


func set_facing(direction: Vector2):
	if direction == Vector2.ZERO:
		return
	if direction.x >= 0:
		if direction.y >= 0:
			facing = "DownRight"
		else:
			facing = "UpRight"
	elif direction.x < 0:
		if direction.y >= 0:
			facing = "DownLeft"
		else:
			facing = "UpLeft"


func play_with_facing(anim_name: String):
	self.play(anim_name + facing)
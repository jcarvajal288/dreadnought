extends AnimationPlayer

const EAST_NORTH_EAST = -PI / 8
const NORTH_NORTH_EAST = -3 * PI / 8
const NORTH_NORTH_WEST = -5 * PI / 8
const WEST_NORTH_WEST = -7 * PI / 8
const EAST_SOUTH_EAST = PI / 8
const SOUTH_SOUTH_EAST = 3 * PI / 8
const SOUTH_SOUTH_WEST = 5 * PI / 8
const WEST_SOUTH_WEST = 7 * PI / 8

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


func play_eight_way(anim_name: String, direction: Vector2):
	var dirString = convert_to_8_way(direction)
	self.play(anim_name + dirString)


func convert_to_8_way(direction: Vector2) -> String:
	var angle = direction.angle()
	if EAST_NORTH_EAST < angle and angle <= EAST_SOUTH_EAST:
		return "Right" 
	elif EAST_SOUTH_EAST < angle and angle <= SOUTH_SOUTH_EAST:
		return "DownRight" 
	elif SOUTH_SOUTH_EAST < angle and angle <= SOUTH_SOUTH_WEST:
		return "Down" 
	elif SOUTH_SOUTH_WEST < angle and angle <= WEST_SOUTH_WEST:
		return "DownLeft" 
	elif NORTH_NORTH_EAST < angle and angle <= EAST_NORTH_EAST:
		return "UpRight" 
	elif NORTH_NORTH_WEST < angle and angle <= NORTH_NORTH_EAST:
		return "Up" 
	elif WEST_NORTH_WEST < angle and angle <= NORTH_NORTH_WEST:
		return "UpLeft" 
	else:
		return "Left" 
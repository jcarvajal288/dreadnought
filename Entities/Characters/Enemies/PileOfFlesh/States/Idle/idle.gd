extends State


func process_frame(_delta: float) -> State:
	var direction_to_player = Global.PLAYER_POSITION - subject.global_position
	animation_player.set_facing(direction_to_player)
	animation_player.play_with_facing(animation_name)
	return null

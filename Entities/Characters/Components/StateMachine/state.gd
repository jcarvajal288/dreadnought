class_name State extends Node

enum AnimationType {
	REGULAR,
	FACING,
	FOUR_WAY,
	EIGHT_WAY
}

@export var animation_name: String
@export var animation_type: AnimationType
var animation_player: AnimationPlayer

var director: Director
var subject: Character
var signal_state_change


func enter() -> void:
	animation_player.play("RESET")
	animation_player.advance(0)
	if animation_type == AnimationType.FACING:
		animation_player.play_with_facing(animation_name)
	elif animation_type == AnimationType.FOUR_WAY:
		animation_player.play_four_way(animation_name, director.shooting_vector)
	elif animation_type == AnimationType.EIGHT_WAY:
		animation_player.play_eight_way(animation_name, director.shooting_vector)
	else:
		animation_player.play(animation_name)


func exit() -> void:
	pass


func process_input(_event: InputEvent) -> State:
	return null


func process_physics(_delta: float) -> State:
	return null


func process_frame(_delta: float) -> State:
	return null

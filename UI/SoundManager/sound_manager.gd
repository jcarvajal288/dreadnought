extends Node

func _ready() -> void:
	Global.play_sound.connect(_on_play_sound)


func  _on_play_sound(sound_effect: Global.SoundEffect, sound_position: Vector2) -> void:
	if sound_effect == Global.SoundEffect.SWARM_ALIEN_DEATH:
		play_sound_at_position($SwarmAlienDeathPlayer, sound_position)


func play_sound_at_position(sound_player: AudioStreamPlayer2D, sound_position: Vector2) -> void:
	sound_player.global_position = sound_position
	sound_player.play()


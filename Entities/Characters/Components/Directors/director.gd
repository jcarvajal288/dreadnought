class_name Director extends Node

@export var subject: CharacterBody2D

var movement_vector = Vector2.ZERO
var attack = false

func reset() -> void:
	movement_vector = Vector2.ZERO
	attack = false

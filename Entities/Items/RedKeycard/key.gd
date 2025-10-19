class_name Key extends Node2D

@export var color: Global.KeyItem


func _ready() -> void:
	$PickupArea.body_entered.connect(_on_body_entered)


func _on_body_entered(body: Node2D) -> void:
	if body is Dreadnought:
		body.inventory[color] = true
		queue_free()

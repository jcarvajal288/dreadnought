class_name Key extends Node2D

@export var color: Global.KeyItem


func _ready() -> void:
	$PickupArea.item_picked_up.connect(_on_item_picked_up)


func _on_item_picked_up(body: Node2D) -> void:
	if body is Dreadnought:
		body.inventory[color] = true

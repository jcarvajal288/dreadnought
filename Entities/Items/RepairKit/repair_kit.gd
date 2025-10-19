class_name RepairKit extends Node2D

var amount_to_repair = 10

func _ready() -> void:
	$PickupArea.item_picked_up.connect(_on_item_picked_up)


func _on_item_picked_up(body: Node2D) -> void:
	if body is Dreadnought:
		body.repair(amount_to_repair)

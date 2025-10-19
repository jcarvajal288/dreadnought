class_name RepairKit extends Node2D

var amount_to_repair = 10

func _ready() -> void:
	$PickupArea.body_entered.connect(_on_body_entered)


func _on_body_entered(body: Node2D) -> void:
	if body is Dreadnought:
		body.repair(amount_to_repair)
		queue_free()

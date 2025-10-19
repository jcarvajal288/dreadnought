class_name PickupArea extends Area2D

signal item_picked_up

func _ready() -> void:
	body_entered.connect(_on_body_entered)


func _on_body_entered(body: Node2D) -> void:
	if body is Dreadnought:
		item_picked_up.emit(body)
		get_parent().queue_free()

extends StaticBody2D


@export var required_key: Global.KeyItem

@onready var is_open = false


func _ready() -> void:
	$OpenSensor.body_entered.connect(_on_body_entered)
	$OpenSensor.body_exited.connect(_on_body_exited)
	$AnimationPlayer.play_backwards('open' + color())


func _on_body_entered(body: Node2D) -> void:
	if body is Dreadnought and has_required_key(body):
		open_door()


func _on_body_exited(body: Node2D) -> void:
	if body is Dreadnought:
		close_door()


func open_door() -> void:
	if not is_open:
		is_open = true
		$AnimationPlayer.play('open' + color())


func close_door() -> void:
	if is_open:
		is_open = false
		$AnimationPlayer.play_backwards('open' + color())


func has_required_key(body: Dreadnought) -> bool:
	if required_key == Global.KeyItem.NONE:
		return true
	else:
		return body.inventory[required_key]


func color() -> String:
	if required_key == Global.KeyItem.RED:
		return "red"
	elif required_key == Global.KeyItem.YELLOW:
		return "yellow"
	elif required_key == Global.KeyItem.BLUE:
		return "blue"
	else:
		return "basic"
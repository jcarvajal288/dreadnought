extends StaticBody2D


func _ready() -> void:
	$OpenSensor.body_entered.connect(_on_body_entered)
	$OpenSensor.body_exited.connect(_on_body_exited)


func _on_body_entered(body: Node2D) -> void:
	if body is Dreadnought:
		open_door()


func _on_body_exited(body: Node2D) -> void:
	if body is Dreadnought:
		close_door()


func open_door() -> void:
	$AnimationPlayer.play('open')


func close_door() -> void:
	$AnimationPlayer.play('close')
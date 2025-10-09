class_name Enemy extends Character

func _init() -> void:
	speed = 25

func _ready() -> void:
	$StateMachine.init(self)


func _on_death() -> void:
	$CollisionShape2D.set_deferred("disabled", true)


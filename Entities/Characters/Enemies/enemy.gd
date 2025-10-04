extends Character

func _init() -> void:
	speed = 30

func _ready() -> void:
	$StateMachine.init(self)



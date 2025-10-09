extends Enemy

func _ready() -> void:
	$StateMachine.init(self)


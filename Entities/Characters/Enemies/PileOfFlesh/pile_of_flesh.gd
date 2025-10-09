extends Enemy

@onready var health = $Health

func _ready() -> void:
	$StateMachine.init(self)


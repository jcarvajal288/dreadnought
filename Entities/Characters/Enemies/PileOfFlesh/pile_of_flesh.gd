extends Enemy

@onready var health = $Health

func _ready() -> void:
	$StateMachine.init(self)
	Global.NUM_SPAWNERS += 1


func _on_death() -> void:
	Global.NUM_SPAWNERS -= 1


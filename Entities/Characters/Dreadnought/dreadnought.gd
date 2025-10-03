class_name Dreadnought extends Character

@onready var leg_animation_player = $LegAnimationPlayer

func _ready() -> void:
	$StateMachine.init(self)
	speed = 25


func _unhandled_input(event: InputEvent) -> void:
	$StateMachine.process_input(event)
		
	
func _physics_process(delta):
	$StateMachine.process_physics(delta)


func _process(delta: float) -> void:
	$StateMachine.process_frame(delta)

class_name Dreadnought extends Character

@export var bullet_impact_scene: PackedScene

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


func shoot(direction: Vector2) -> void:
	var distance = Vector2(32.0, 32.0)
	var impact_position = direction * distance
	var impact = bullet_impact_scene.instantiate()
	impact.set_facing(direction)
	impact.global_position = global_position + impact_position
	get_tree().root.add_child(impact)

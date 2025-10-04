class_name Dreadnought extends Character

@export var bullet_impact_scene: PackedScene

@onready var leg_animation_player = $LegAnimationPlayer

func _ready() -> void:
	speed = 25
	$StateMachine.init(self)


func _physics_process(_delta):
	Global.PLAYER_POSITION = self.global_position


func shoot(direction: Vector2) -> void:
	var distance = Vector2(32.0, 32.0)
	var impact_position = direction * distance
	var impact = bullet_impact_scene.instantiate()
	impact.set_facing(direction)
	impact.global_position = global_position + impact_position
	get_tree().root.add_child(impact)

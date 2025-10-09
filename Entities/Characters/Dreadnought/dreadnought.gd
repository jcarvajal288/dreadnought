class_name Dreadnought extends Character

@export var bullet_spawner_scene: PackedScene
@export var flame_effect_scene: PackedScene

@onready var leg_animation_player = $LegAnimationPlayer

func _ready() -> void:
	speed = 25
	$StateMachine.init(self)


func _physics_process(_delta):
	Global.PLAYER_POSITION = self.global_position


func shoot(direction: Vector2) -> void:
	var bullet_spawner = bullet_spawner_scene.instantiate()
	var distance = 32.0
	bullet_spawner.global_position = global_position + direction * distance 
	bullet_spawner.direction = direction
	get_tree().root.add_child(bullet_spawner)
	bullet_spawner.set_velocity()


func flamethrower(direction: Vector2) -> void:
	var flame_effect = flame_effect_scene.instantiate()
	add_child(flame_effect)
	flame_effect.set_owning_character(self)
	flame_effect.start(direction)

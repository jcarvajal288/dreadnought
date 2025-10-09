extends State

@export var subject_health: Health

func _ready() -> void:
	subject_health.on_death.connect(_on_death)


func _on_death() -> void:
	signal_state_change.emit(self)

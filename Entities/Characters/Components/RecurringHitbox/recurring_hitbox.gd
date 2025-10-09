class_name RecurringHitbox extends Hitbox

@export var damage_interval: float


func _ready() -> void:
	$Timer.timeout.connect(_on_timeout)
	$Timer.start(damage_interval)


func _on_timeout() -> void:
	var overlapping_bodies = get_overlapping_areas()
	print(overlapping_bodies.size())
	for body in overlapping_bodies:
		if body is Hurtbox:
			body._on_area_entered(self)

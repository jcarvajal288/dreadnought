extends Control


func _process(_delta: float) -> void:
	$Label.text = str(Global.NUM_SPAWNERS)

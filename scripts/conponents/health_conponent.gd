extends Node
class_name HealthConponent

var health_value

func _ready() -> void:
	pass

func set_health(heatlh: int):
	health_value = heatlh

func deal_damage(amount: int):
	health_value -= amount
	if health_value <= 0:
		get_parent().queue_free()

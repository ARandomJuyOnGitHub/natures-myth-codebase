extends Node
class_name HealthConponent

var health_value
signal damage_dealt

func _ready() -> void:
	pass

func set_health(heatlh: int):
	health_value = heatlh

func deal_damage(amount: int, body: Node2D):
	health_value -= amount
	damage_dealt.emit(body)
	if health_value <= 0:
		get_parent().queue_free()

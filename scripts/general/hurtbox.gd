extends Area2D




func _on_body_entered(body: Node2D) -> void:
	body.health_conponent.deal_damage(1, self)

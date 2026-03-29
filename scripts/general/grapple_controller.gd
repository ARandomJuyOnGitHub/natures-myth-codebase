extends Node

@export var player: CharacterBody2D
@onready var ray: RayCast2D = $RayCast2D

# Called when the node enters the scene tree for the first time.


func check_ray():
	ray.look_at(player.get_global_mouse_position())
	
	ray.force_raycast_update()
	if ray.is_colliding():
		var collider = ray.get_collider()
		if collider.is_class("CharacterBody2D") and collider.is_in_group("Enemies"):
			collider.health_handler.deal_damage(1)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("mouse_left"):
		print("if yay")
		check_ray()

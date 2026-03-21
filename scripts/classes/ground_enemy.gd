extends CharacterBody2D
class_name GroundEnemy

@export var speed := 100
@onready var horizontal_ray = $HorizontalRayCast
@onready var vertical_ray = $VerticalRayCast

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	velocity.x = speed
	pass # Replace with function body.

func flip():
	horizontal_ray.target_position.x *= -1
	print(vertical_ray.position.x)
	vertical_ray.position.x *= -1
	print(vertical_ray.position.x)
	velocity.x *= -1
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	if horizontal_ray.is_colliding() or !vertical_ray.is_colliding():
		flip()
	
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	move_and_slide()

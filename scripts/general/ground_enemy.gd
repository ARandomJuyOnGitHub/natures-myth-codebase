extends CharacterBody2D
class_name GroundEnemy

@export var health = 1
@export var speed := 100
@onready var horizontal_ray = $HorizontalRayCast
@onready var vertical_ray = $VerticalRayCast

@onready var health_handler = $HealthConponent

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	health_handler.set_health(health)
	velocity.x = speed
	pass # Replace with function body.

func flip():
	horizontal_ray.target_position.x *= -1
	vertical_ray.position.x *= -1
	velocity.x *= -1
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	if horizontal_ray.is_colliding() or !vertical_ray.is_colliding():
		flip()
	
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	move_and_slide()

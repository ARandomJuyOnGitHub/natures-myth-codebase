extends CharacterBody2D

@export_group("General Settings")
@export var health = 3
@export var stun_time = 1 # in seconds
@export var i_frames_duration = 2 # in seconds
@export var knock_back_force = 400

@export_group("Movement Settings")
@export var movement_speed = 100
@export var acceleration = 0.1
@export var deceleration = 0.1
@export var jump_velocity = -300
@export var air_resistance = 2.0

@export_group("Grappling Settings")
@export var pull_strength = 1
@export var max_rope_force = 6000
@export var max_velocity = 10000

@onready var health_conponent: HealthConponent = $HealthConponent
@onready var state_machine: StateMachine = $GroundStates
@onready var i_frames: Timer = $IFrames
@onready var sprite = $AnimatedSprite2D

var facing_direction = 1

func  _ready() -> void:
	health_conponent.set_health(health)

func  _process(delta: float) -> void:
	if sign(facing_direction) != sign(sprite.scale.x):
		sprite.scale.x *= -1

# will probably have to add more later
func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	move_and_slide()

func _on_health_conponent_damage_dealt(body: Node2D) -> void:
	# if i frames are active
	if !i_frames.is_stopped():
		health_conponent.health_value += 1 # a bit scuffed but works for now
		return

	i_frames.start(i_frames_duration)
	var direction = Vector2(cos(PI/3),-sin(PI/3)) # 60 degrees
	var side = position.x - body.global_position.x
	direction.x *= sign(side)
	velocity = direction * knock_back_force
	
	var current_state = state_machine.get_state()
	state_machine.on_transition(current_state, "DamagedState")

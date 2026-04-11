extends State
class_name MovingState

var anim_sprite: AnimatedSprite2D

func enter():
	#print("entered moving state!")
	anim_sprite = subject.sprite
	anim_sprite.play("walk")
	pass

func exit():
	anim_sprite.stop()

func update(_delta: float):
	if Input.is_action_just_pressed("mouse_left"):
		Transition.emit(self, "GrapplingState")
		
	if Input.is_action_just_pressed("mouse_right"):
		Transition.emit(self, "LaunchingState")
	
	if Input.is_action_just_pressed("jump") and subject.is_on_floor():
		Transition.emit(self, "JumpingState")

func physics_update(_delta: float):
	var direction = get_move_direction()
	if direction == 0:
		Transition.emit(self, "IdleState")
		return
	subject.facing_direction = direction
	
	subject.velocity.x = lerp(
		subject.velocity.x,
		subject.movement_speed * direction,
		subject.acceleration
	)
	
	
func get_move_direction():
	return Input.get_axis("move_left", "move_right")

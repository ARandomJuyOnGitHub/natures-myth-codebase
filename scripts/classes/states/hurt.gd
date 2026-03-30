extends State
class_name DamagedState

@onready var timer = $Timer

func enter():
	print("lol")
	timer.start(subject.stun_time)

func  exit():
	timer.stop()

func update(_dt):
	if subject.is_on_floor():
		subject.velocity = Vector2.ZERO

func _on_timer_timeout() -> void:
	Transition.emit(self, "IdleState")

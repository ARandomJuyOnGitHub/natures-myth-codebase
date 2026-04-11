extends Node

@export var array: Dictionary[String, SpriteFrames] = {
	"WalkingAnimation": null
}

@onready var sprite = $AnimatedSprite2D
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# idk yet


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

extends CharacterBody2D

@export var moveDir = Vector2.ZERO

func _ready() -> void:
	self.velocity = moveDir

func _process(delta: float) -> void:
	move_and_slide()

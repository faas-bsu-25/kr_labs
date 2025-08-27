extends CharacterBody2D

const MOVE_SPEED = 100
const FRICTION = 0.9

func _process(delta: float) -> void:
	self.velocity *= FRICTION
	
	if Input.is_action_pressed("left_player_up"):
		self.velocity.y = -MOVE_SPEED
	if Input.is_action_pressed("left_player_down"):
		self.velocity.y = MOVE_SPEED
	
	move_and_slide()

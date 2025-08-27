extends CharacterBody2D

const X_SPEED = 3
const Y_SPEED = 4

func _ready() -> void:
	var goRight = randi() % 2
	var goDown = randi() % 2
	
	self.velocity.x = X_SPEED if goRight else -X_SPEED
	self.velocity.y = Y_SPEED if goDown else -Y_SPEED

func _process(delta: float) -> void:
	var collision = move_and_collide(self.velocity)
	
	if collision:
		self.velocity = velocity.bounce(collision.get_normal())

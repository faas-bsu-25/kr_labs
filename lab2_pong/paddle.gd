extends CharacterBody2D

const MOVE_SPEED = 100
const FRICTION = 0.9

func _process(delta: float) -> void:
	self.velocity *= FRICTION
	
	var direction = Input.get_axis("left_player_up", "left_player_down")
	
	self.velocity.y = MOVE_SPEED * direction
	
	move_and_slide()

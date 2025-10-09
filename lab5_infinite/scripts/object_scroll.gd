class_name ScrollingObject extends CollisionObject2D

@export var move_speed = 175

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	self.position.x -= move_speed * delta

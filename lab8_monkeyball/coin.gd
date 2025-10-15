@tool
extends Area3D


func _process(delta: float) -> void:
	var rotation_speed = 2
	rotate_y(rotation_speed * delta)




func _on_body_entered(body: Node3D) -> void:
	# do whatevs
	self.queue_free()

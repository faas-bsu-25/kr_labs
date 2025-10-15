extends Node3D


func _process(delta: float) -> void:
	## reset rotation when holding R
	if Input.is_action_pressed("monkeyball_reset"):
		self.rotation.x = rotate_toward(self.rotation.x, 0, 0.025)
		self.rotation.y = rotate_toward(self.rotation.y, 0, 0.025)
		self.rotation.z = rotate_toward(self.rotation.z, 0, 0.025)
	
	## rotate in input direction
	var input_dir = Input.get_vector("monkeyball_left", "monkeyball_right", "monkeyball_backward", "monkeyball_forward")
	## somehow my left and right were inverted
	self.rotate_x(input_dir.x * -1 * delta)
	self.rotate_z(input_dir.y * delta)
	
	# radians, not degrees
	## keep from rotating too far
	self.rotation.x = clamp(self.rotation.x, -0.5, 0.5)
	self.rotation.y = 0 ## it can become offset otherwise
	self.rotation.z = clamp(self.rotation.z, -0.5, 0.5)

extends Label

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("platformer_hidecontrols"):
		self.visible = !self.visible

extends CharacterBody2D
var blueFish = find_child("Sprite")

func _process(delta: float) -> void:
	
	# simulating friction
	self.velocity *= .95
	
	if Input.is_action_pressed("ui_right"):
		self.velocity.x = 100
	if Input.is_action_pressed("ui_left"):
		self.velocity.x = -100
	if Input.is_action_pressed("ui_up"):
		self.velocity.y = -100
	if Input.is_action_pressed("ui_down"):
		self.velocity.y = 100
	
	move_and_slide()

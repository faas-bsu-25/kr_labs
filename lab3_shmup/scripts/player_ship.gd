extends CharacterBody2D

const SPEED = 3

@export var allow_vertical_movement: bool
@export var laser_component: PackedScene

func _process(_delta: float) -> void:
	move()
	shoot_laser_if_just_pressed()

func move():
	self.velocity *= 0.9
	
	var xDirection = Input.get_axis("shmup_left", "shmup_right")
	var yDirection = Input.get_axis("shmup_up", "shmup_down")
	
	if xDirection != 0:
		self.velocity.x = SPEED * xDirection
	if yDirection != 0 and allow_vertical_movement:
		self.velocity.y = SPEED * yDirection
	
	move_and_collide(self.velocity)

func shoot_laser_if_just_pressed():
	if Input.is_action_just_pressed("shmup_shoot"):
		# Make a laser
		var laser: RigidBody2D = laser_component.instantiate()
		# Put it on screen
		get_node("/root/").add_child(laser)
		# Position laser
		laser.position = self.position + Vector2(0, -50)

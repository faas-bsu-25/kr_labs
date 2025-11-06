extends CharacterBody3D


const SPEED = 5.0
const JUMP_VELOCITY = 4.5

@export var MOUSE_SENSITIVITY = 0.01

var mouse_on_screen;
var last_selected = null;

@onready var camera = $Camera3D
@onready var rotator = $CameraRotator
@onready var raycast = $Camera3D/RayCast3D
@onready var joint = $Camera3D/PickupJoint


func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)


func _process(_delta: float) -> void:
	# lock/unlock mouse
	if Input.is_action_just_pressed("ballchase_unlock_mouse"):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	if Input.is_action_just_released("ballchase_unlock_mouse"):
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	
	# raycast
	var selected
	
	if raycast.is_colliding():
		selected = raycast.get_collider()
		
		if selected is Selectable:
			selected.ray_select()
			
			if Input.is_action_just_pressed("ballchase_interact"):
				joint.node_b = selected.get_path()
	
	elif Input.is_action_just_pressed("ballchase_interact"):
		joint.set_node_b("")
	
	if last_selected:
		if last_selected != selected and last_selected is Selectable:
			last_selected.ray_deselect()
	
	last_selected = selected
	
	# quit when `esc` pressed
	if Input.is_action_just_released("ui_cancel"):
		get_tree().quit(0)


func _physics_process(_delta: float) -> void:
	# Player movement
	var player_dir = Input.get_vector(
			"ballchase_left", "ballchase_right", 
			"ballchase_forward", "ballchase_backward")
	
	# Relative to "forward" direction (typically positive z)
	self.velocity = ((self.transform.basis.z * player_dir.y) + (self.transform.basis.x * player_dir.x)) * SPEED	
	self.velocity.y = 0 * SPEED
	
	move_and_slide()


func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion and Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
		# rotate player left/right
		self.rotate_y(-event.relative.x * MOUSE_SENSITIVITY)
		
		# rotate camera up/down
		rotator.rotate_x(-event.relative.y * MOUSE_SENSITIVITY)
		rotator.rotation.x = clamp(rotator.rotation.x, -.8, .8)
		camera.rotation.x = rotator.rotation.x
		

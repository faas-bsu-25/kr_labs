extends CharacterBody2D

@export var respawn_position: Vector2 = Vector2(0, -100)

const SPEED: float = 300.0
const JUMP_VELOCITY: float = -400.0

var direction: int = 0

func _process(delta: float) -> void:
	match direction:
		-1: $Sprite.flip_h = false;
		1: $Sprite.flip_h = true;

func _physics_process(delta: float) -> void:
	# Gravity
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	# Jump
	if Input.is_action_just_pressed("platformer_jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	
	# Reset
	if Input.is_action_just_pressed("platformer_reset"):
		self.position = Vector2(respawn_position.x, 0)
	
	# Velocity/direction
	direction = Input.get_axis("platformer_left", "platformer_right")
	velocity.x = direction * SPEED if direction else move_toward(velocity.x, 0, SPEED)
	
	# Move
	move_and_slide()


func on_screen_exited() -> void:
	if ($RespawnTimer.is_stopped() or $RespawnTimer.paused):
		$RespawnTimer.start();

func _on_respawn_timer_timeout() -> void:
	self.position = respawn_position
	self.velocity = Vector2.ZERO

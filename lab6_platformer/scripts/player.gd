extends CharacterBody2D

@export var respawn_position: Vector2 = Vector2(0, -100)

const SPEED: float = 300.0
const JUMP_VELOCITY: float = -400.0

var direction: int = 0
var was_on_floor: bool = true

func _ready() -> void:
	$Sprite.play("default")

func _process(delta: float) -> void:
	# Look in movement direction
	match direction:
		-1: $Sprite.flip_h = false;
		1: $Sprite.flip_h = true;
	
	# Play landing sound when landing
	if self.is_on_floor() and !was_on_floor:
		$Sounds/Land.play()
	
	was_on_floor = is_on_floor()

func _physics_process(delta: float) -> void:
	# Gravity
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	# Jump
	if Input.is_action_just_pressed("platformer_jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		$Sounds/Jump.play()
	
	# Reset
	if Input.is_action_just_pressed("platformer_reset") and (0 < self.position.x and self.position.x < 1152) and (0 < self.position.y and self.position.y < 648):
		self.position = Vector2(respawn_position.x, 20)
	
	# Velocity/direction
	direction = Input.get_axis("platformer_left", "platformer_right")
	velocity.x = direction * SPEED if direction else move_toward(velocity.x, 0, SPEED)
	
	# Move
	move_and_slide()


func on_screen_exited() -> void:
	if ($RespawnNotifier/Timer.is_stopped() or $RespawnNotifier/Timer.paused):
		$RespawnNotifier/Timer.start();

func _on_respawn_timer_timeout() -> void:
	self.position = respawn_position
	self.velocity = Vector2.ZERO

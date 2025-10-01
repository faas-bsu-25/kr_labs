extends CharacterBody2D

@export var jump_power = 600

var is_hurt = false
var has_jumped = false

func hurt():
	is_hurt = true
	$AnimSprite.play("hurt")
	$SFX/Hurt.play()
	print("hurt")

func _on_anim_sprite_animation_finished() -> void:
	is_hurt = false;
	print("finished")


func _process(delta: float) -> void:
	# fall
	self.velocity.y += get_gravity().y * delta
	
	# jump
	if (Input.is_action_just_pressed("infinite_jump") and self.is_on_floor()):
		self.velocity.y = -jump_power
		has_jumped = true
		$AnimSprite.play("jump")
		$SFX/Jump.play()
		print("jump")
	elif (self.is_on_floor() and has_jumped):
		has_jumped = false
		$AnimSprite.play("run")
		print("run")
	
	move_and_slide()

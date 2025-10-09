class_name Player extends CharacterBody2D

@export var speed: float = 10000

@onready var anim_tree: AnimationTree = $AnimationTree
@onready var sprite: Sprite2D = $Sprite

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	var dir: Vector2 = Input.get_vector("shmup_left", "shmup_right", "shmup_up", "shmup_down")
	self.velocity = dir * speed * delta
	
	if dir.x < 0:
		$Sprite.flip_h = true
		$Hurtbox.scale.x = abs($Hurtbox.scale.x) * -1
	elif dir.x > 0: 
		$Sprite.flip_h = false
		$Hurtbox.scale.x = abs($Hurtbox.scale.x)
	
	if self.velocity.length() > 0:
		anim_tree["parameters/conditions/walk"] = true
		anim_tree["parameters/conditions/idle"] = false
	else:
		anim_tree["parameters/conditions/walk"] = false
		anim_tree["parameters/conditions/idle"] = true
	
	if Input.is_action_just_pressed("shmup_shoot"):
		anim_tree["parameters/conditions/attack"] = true
	else:
		anim_tree["parameters/conditions/attack"] = false
	
	move_and_slide()


func _on_hurtbox_body_entered(body: Node2D) -> void:
	print("Hit target: %s" % body.name)
	
	if body is Dummy: 
		var hit_angle := self.get_angle_to(body.position)
		var hit_dir := Vector2.from_angle(hit_angle).normalized()
		body.hit(hit_dir)

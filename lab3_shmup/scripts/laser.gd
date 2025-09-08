extends RigidBody2D

@export var shoot_speed = 500
@export var explosion_scene: PackedScene

func _ready() -> void:
	self.apply_impulse(Vector2(0, -shoot_speed))
	$LaserSound.play()

func _on_body_entered(body: Node) -> void:
	get_node("/root/Shmup").increment_score()
	
	var explosion: GPUParticles2D = explosion_scene.instantiate()
	add_sibling(explosion)
	explosion.position = body.position
	
	body.queue_free()
	self.queue_free()

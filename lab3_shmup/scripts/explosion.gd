extends GPUParticles2D

func _ready() -> void:
	self.one_shot = true
	self.emitting = true
	$ExplosionSound.play()

func _on_finished() -> void:
	self.queue_free()

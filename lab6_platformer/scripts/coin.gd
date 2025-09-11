extends Area2D

func _on_body_entered(body: Node2D) -> void:
	get_node("/root/Platformer").coin_collected()
	self.queue_free()

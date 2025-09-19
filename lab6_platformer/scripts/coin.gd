extends Area2D

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		# Coins           TestLevel
		self.get_parent().get_parent().coin_collected()
		self.queue_free()

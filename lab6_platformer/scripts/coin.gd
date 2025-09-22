extends Area2D

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		self.get_parent().get_parent().coin_collected()
		body.get_node("CoinPickupSound").play()
		self.queue_free()

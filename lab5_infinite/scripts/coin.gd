class_name Coin extends ScrollingObject

func _on_body_entered(body: Node2D) -> void:
	print("ow")
	body.hurt()

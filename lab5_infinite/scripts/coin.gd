extends "res://lab5_infinite/scripts/object_scroll.gd"

func _on_body_entered(body: Node2D) -> void:
	print("ow")
	body.hurt()

extends Node2D


const GROUND_SCENE = preload("res://lab5_infinite/components/ground.tscn")

func _on_timer_timeout() -> void:
	var new_ground = GROUND_SCENE.instantiate();
	new_ground.position = self.position
	get_node("/root/InfiniteRunner").add_child(new_ground)
	pass # Replace with function body.

class_name Selectable
extends RigidBody3D


@onready var main_mesh = $Mesh


func ray_select():
	main_mesh.get_active_material(0).next_pass.set_shader_parameter("outline_width", 10)


func ray_deselect():
	main_mesh.get_active_material(0).next_pass.set_shader_parameter("outline_width", 0)

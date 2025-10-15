@tool
extends Camera3D


@export var target: Node3D
@export var offset: Vector3
	
@export_tool_button("Set Offset to Position", "ArrowRight") var offset_button_action: Callable = _set_offset_to_position
@export_tool_button("Set Position to Offset", "ArrowLeft") var position_button_action: Callable = _set_position_to_offset


func _process(_delta: float) -> void:
	if not Engine.is_editor_hint():
		self.global_position = lerp(self.global_position, target.global_position + offset, .1)
		self.look_at(target.global_position)

func _set_position_to_offset():
	position = offset
func _set_offset_to_position():
	offset = position

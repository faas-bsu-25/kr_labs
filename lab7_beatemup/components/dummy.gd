class_name Dummy extends CharacterBody2D

@export var health: float = 5
@export var health_bar_gradient: Gradient
@onready var points_in_gradient = health_bar_gradient.get_point_count()

func hit(hit_dir: Vector2) -> void:
	health -= 1
	$HealthBar.value = health
	$HealthBar.modulate = health_bar_gradient.get_color(points_in_gradient * health / 5)
	
	self.velocity = hit_dir * 300
	
	if health <= 0:
		print("*dies*")
		self.queue_free()

func _ready() -> void:
	$HealthBar.modulate = Color.GREEN

func _process(_delta: float) -> void:
	self.velocity *= 0.98
	move_and_slide()

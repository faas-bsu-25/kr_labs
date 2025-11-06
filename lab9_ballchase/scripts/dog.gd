extends CharacterBody3D


const SPEED = 5.0

var target: Vector3

@onready var agent := $Agent
@onready var ball: Selectable = get_node("/root/BallChaseGame/Ball")


func _ready() -> void:
	set_walk_target(ball)


func _process(_delta: float) -> void:
	if ball.position != target:
		set_walk_target(ball)


func _physics_process(_delta: float) -> void:
	if position.distance_to(target) > 1.5:
		var next_point: Vector3 = agent.get_next_path_position()
		next_point.y = 0
		
		# snap look
		#self.look_at(next_point)
		
		# smooth look
		var looking := self.transform.looking_at(next_point)
		## want to get to
		var a := Quaternion(looking.basis)
		## currently at
		var b := Quaternion(basis)
		## rotate 4% closer to [a]
		var c := b.slerp(a, 0.04)
		## de-convert Quaternion to usable Basis
		self.transform.basis = Basis(c)
		
		self.velocity = -transform.basis.z * SPEED
	else:
		self.velocity = Vector3.ZERO
	
	move_and_slide()


func set_walk_target(targ: PhysicsBody3D):
	agent.target_position = targ.position
	target = targ.position

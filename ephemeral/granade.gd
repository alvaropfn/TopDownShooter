extends RigidBody2D

@export var spd = 1700
@export var dir = Vector2.UP
var printed = false

func _ready():
	linear_velocity = dir * spd
	rotate(dir.angle())
	gravity_scale = 0
	

func _physics_process(delta):
	
	
	if(not printed):
		printed = true
	

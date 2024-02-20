extends RigidBody2D

@export var spd = 300
@export var dir = Vector2.UP

func _ready():
	rotate(dir.angle())
	gravity_scale = 0


func _physics_process(delta):
	linear_velocity = dir * spd * delta

extends RigidBody2D

@export var spd = 1200
@export var dir = Vector2.UP

func _ready():
	rotate(dir.angle())
	gravity_scale = 0
	mass = 0


func _physics_process(_delta):
	linear_velocity = dir * spd
	if get_contact_count() > 0:
		apply_damage(get_colliding_bodies())


func apply_damage(body):
	print(body)
	queue_free()


func _on_timer_timeout():
	print('lazer died')
	queue_free()
	

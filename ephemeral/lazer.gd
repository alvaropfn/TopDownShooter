extends RigidBody2D

@export var spd = 1500
@export var dir = Vector2.UP
@export var dmg = 1

func _ready():
	rotate(dir.angle())
	gravity_scale = 0
	mass = 0.0001


func _physics_process(_delta):
	linear_velocity = dir * spd
	if get_contact_count() > 0:
		apply_damage(get_colliding_bodies(), dmg)


func apply_damage(bodies, value):
	queue_free()
	for body in bodies:
		if body.has_node("HealthManager"):
			body.find_child("HealthManager").hit(value)


func _on_timer_timeout():
	print('lazer fade')
	queue_free()
	

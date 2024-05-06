extends RigidBody2D

@export var spd = 1700
@export var dir = Vector2.UP
var printed = false

func _ready():
	linear_velocity = dir * spd
	rotate(dir.angle())


func _physics_process(_delta):
	if(not printed):
		printed = true


#func _on_timer_timeout():
	#var animation = $ExplosionAnimationPlayer as AnimationPlayer
	#print("explode")
	#animation.active = true

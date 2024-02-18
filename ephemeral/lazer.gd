extends PhysicsBody2D

@export var lazer_speed = 10

func _physics_process(_delta):
	move_to_front()
	#velocity = rotation * lazer_speed
	#move_to_front()
	#position += lazer_speed * delta

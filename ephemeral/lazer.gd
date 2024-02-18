extends Node2D

@export var lazer_speed = 10

func _ready():
	var mouse_pos= get_global_mouse_position()
	var target_rotation = atan2(mouse_pos.y - global_position.y, mouse_pos.x - global_position.x)
	#target_rotation += deg_to_rad(45)
	rotation = target_rotation
	

func _physics_process(_delta):
	position = Vector2(position.x + lazer_speed, position.y + lazer_speed)

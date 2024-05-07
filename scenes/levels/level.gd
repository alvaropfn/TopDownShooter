extends Node2D
class_name LevelParent

@export var SUN = {
	inside = 0.55,
	outside = 0.25,
	duration = 2,
}

func _physics_process(_delta):
	var player = $Player/Camera2D.get_parent() as Node2D
	var dir = (get_global_mouse_position() - player.position).normalized()
	var cam = $Player/Camera2D as Camera2D
	var current = cam.offset
	var target = dir * 300 
	var speed = 0.1
	
	cam.offset = lerp(current, target, speed)


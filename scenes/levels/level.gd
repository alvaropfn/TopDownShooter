extends Node2D

@export var ZOOM = {
	close = Vector2(1,1),
	open = Vector2(0.65,0.65),
	duration = 1,
}

@export var SUN = {
	inside = 0.55,
	outside = 0.25,
	duration = 2,
}

func _on_gate_gate_entered(body):
	print("gate entered by: ", body)


func _on_gate_gate_exited(body):
	print("gate exited by: ", body)


func _physics_process(_delta):
	var player = $Player/Camera2D.get_parent() as Node2D
	var dir = (get_global_mouse_position() - player.position).normalized()
	var cam = $Player/Camera2D as Camera2D
	var current = cam.offset
	var target = dir * 300 
	var speed = 0.1
	
	cam.offset = lerp(current, target, speed)


func _on_house_player_entered(_body):
	var tween = get_tree().create_tween()
	tween.set_parallel()
	tween.tween_property($Player/Camera2D, "zoom", ZOOM.close, ZOOM.duration)
	tween.tween_property($DirectionalLight2D, "energy", SUN.inside, SUN.duration)


func _on_house_player_exited(_body):
	var tween = get_tree().create_tween()
	tween.set_parallel()
	tween.tween_property($Player/Camera2D, "zoom", ZOOM.open, ZOOM.duration)
	tween.tween_property($DirectionalLight2D, "energy", SUN.outside, SUN.duration)

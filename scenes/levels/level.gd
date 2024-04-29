extends Node2D

func _on_gate_gate_entered(body):
	print("gate entered by: ", body)

func _on_gate_gate_exited(body):
	print("gate exited by: ", body)


func _physics_process(delta):
	var player = $Player/Camera2D.get_parent() as Node2D
	var dir = (get_global_mouse_position() - player.position).normalized()
	var cam = $Player/Camera2D as Camera2D
	var current = cam.offset
	var target = dir * 300 
	var speed = 0.1
	
	cam.offset = lerp(current, target, speed)

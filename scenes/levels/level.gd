extends Node2D
class_name LevelParent

signal change_scene

@export var SUN = {
	inside = 0.55,
	outside = 0.25,
	duration = 2,
}

@export var ZOOM = {
	close = Vector2(1,1),
	open = Vector2(0.65,0.65),
	duration = 1,
}


func _physics_process(_delta):
	#var player = $Player as Node2D
	#var cam = $Player/Camera2D as Camera2D
	#if not player or not cam: return
	#
	#var dir = (get_global_mouse_position() - player.position).normalized()
	#var current = cam.offset
	#var target = dir * 300 
	#var speed = 0.1
	#
	#cam.offset = lerp(current, target, speed)
	pass


func scene_changer(new_scene: PackedScene, old_scene):
	GameEventController.change_scene(new_scene, old_scene)


func open_camera():
	var camera = $Player/Camera2D
	var light = $Lights/AmbientLight
	if not camera or not light: return
	
	var tween = get_tree().create_tween()
	tween.set_parallel()
	tween.tween_property(camera, "zoom", ZOOM.open, ZOOM.duration)
	tween.tween_property(light, "energy", SUN.outside, SUN.duration)
	

func close_camera():
	var camera = $Player/Camera2D
	var light = $Lights/AmbientLight
	if not camera or not light: return
	
	var tween = get_tree().create_tween()
	tween.set_parallel()
	tween.tween_property(camera, "zoom", ZOOM.close, ZOOM.duration)
	tween.tween_property(light, "energy", SUN.inside, SUN.duration)


func _on_player_lazer_shoot():
	$Ui.update_laser_text()


func _on_player_granade_shoot():
	$Ui.update_granade_text()


extends Node

signal change_scene_signal(new_scene, old_scene)

var laser_amount = 20
var granade_count = 10


func _ready():
	print("GameEventController ready")


func change_scene(new_scene, old_scene):
	emit_signal("change_scene_signal", new_scene, old_scene)



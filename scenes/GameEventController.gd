extends Node

signal change_scene_signal(new_scene, old_scene)

func _ready():
	print("GameEventController ready")


func change_scene(new_scene, old_scene):
	emit_signal("change_scene_signal", new_scene, old_scene)

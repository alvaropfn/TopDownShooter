extends Node2D

@export var current_scene: PackedScene

func _ready():
	if not current_scene.can_instantiate(): return
	var level = find_child("Level")
	level.add_child(current_scene.instantiate())
	GameEventController.change_scene_signal.connect(on_scene_change)
	

func on_scene_change(new_scene, old_scene):
	var level = find_child("Level")
	old_scene.call_deferred("queue_free")
	level.call_deferred("add_child",new_scene.instantiate())

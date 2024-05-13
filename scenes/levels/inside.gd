extends LevelParent

var outside_level_scene: PackedScene# = preload("res://scenes/levels/outside.tscn")

func _ready():
	outside_level_scene = load("res://scenes/levels/outside.tscn")


func _on_gate_exit_area_body_entered(_body):
	scene_changer(load("res://scenes/levels/outside.tscn"), self)



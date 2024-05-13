extends LevelParent

var inside_level_scene: PackedScene# = preload("res://scenes/levels/inside.tscn")

func _ready():
	inside_level_scene = load("res://scenes/levels/inside.tscn")
	open_camera()


func _on_gate_gate_entered(_body):
	scene_changer(load("res://scenes/levels/inside.tscn"), self)



func _on_house_player_entered(_body):
	close_camera()


func _on_house_player_exited(_body):
	open_camera()

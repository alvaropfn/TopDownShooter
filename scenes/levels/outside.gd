extends LevelParent

@export var ZOOM = {
	close = Vector2(1,1),
	open = Vector2(0.65,0.65),
	duration = 1,
}

func _on_gate_gate_entered(body):
	var player = body as CharacterBody2D
	print("gate entered by: ", player)
	
	var tween = create_tween()
	tween.tween_property($Player, "spd_lmt", 0, .75).set_trans(Tween.TRANS_SINE)


func _on_gate_gate_exited(body):
	print("gate exited by: ", body)



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

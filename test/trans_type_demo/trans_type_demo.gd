extends Node2D

var stt = Vector2(150, 12)
var end = Vector2(250, 12)
var dur = 2
func animate(node, trans): 
	var tween = create_tween().set_loops()
	tween.tween_property(node, "position", end, dur).set_trans(trans)
	tween.tween_property(node, "position", stt, dur).set_trans(trans)


func _ready():
	animate($TRANS/TRANS_LINEAR/Sprite2D, Tween.TRANS_LINEAR)
	animate($TRANS/TRANS_SINE/Sprite2D, Tween.TRANS_SINE)
	animate($TRANS/TRANS_QUINT/Sprite2D, Tween.TRANS_QUINT)
	animate($TRANS/TRANS_QUART/Sprite2D, Tween.TRANS_QUART)
	animate($TRANS/TRANS_QUAD/Sprite2D, Tween.TRANS_QUAD)
	animate($TRANS/TRANS_EXPO/Sprite2D, Tween.TRANS_EXPO)
	animate($TRANS/TRANS_ELASTIC/Sprite2D, Tween.TRANS_ELASTIC)
	animate($TRANS/TRANS_CUBIC/Sprite2D, Tween.TRANS_CUBIC)
	animate($TRANS/TRANS_CIRC/Sprite2D, Tween.TRANS_CIRC)
	animate($TRANS/TRANS_BOUNCE/Sprite2D, Tween.TRANS_BOUNCE)
	animate($TRANS/TRANS_BACK/Sprite2D, Tween.TRANS_BACK)
	animate($TRANS/TRANS_SPRING/Sprite2D, Tween.TRANS_SPRING)


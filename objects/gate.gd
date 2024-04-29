extends StaticBody2D

signal gate_entered
signal gate_exited

func _on_gate_area_body_entered(body):
	emit_signal("gate_entered", body)
	
	

func _on_gate_area_body_exited(body):
	emit_signal("gate_exited", body)

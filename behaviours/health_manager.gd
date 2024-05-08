extends Node

@export var health : float
@export var max_health  = 2.0

signal entity_die
signal hited

func _ready():
	health = max_health


func hit(value):
	#print(value," damage to: ", get_parent().name, " ", health, " left")
	emit_signal("hited")
	if health - value > 0:
		health -= value
	else:
		health = 0
		emit_signal("entity_die")

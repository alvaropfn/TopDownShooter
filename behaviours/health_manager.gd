extends Node

@export var health : float
@export var max_health  = 10.0

signal entity_die

func _ready():
	health = max_health


func apply_damage(value):
	print(value," damage to: ", get_parent().name, " ", health, " left")
	if health - value > 0:
		health -= value
	else:
		health = 0
		emit_signal("entity_die")

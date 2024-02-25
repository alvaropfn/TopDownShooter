extends Node

@export var health : float
@export var max_health  = 10.0

signal entity_die

func _ready():
	health = max_health


func damage(amount):
	if health - amount > 0:
		health = health - amount
	else:
		health = 0
		emit_signal("entity_die")

extends CanvasLayer

@export var red: Color = Color("ea85c3")
@export var green: Color = Color("6bbfa3")

@onready var laser_label: Label = $AmmoCounter/HBoxContainer/LaserCount/Label
@onready var laser_icon: TextureRect = $AmmoCounter/HBoxContainer/LaserCount/TextureRect

@onready var granade_label: Label = $AmmoCounter/HBoxContainer/GranadeCount/Label
@onready var granade_icon: TextureRect = $AmmoCounter/HBoxContainer/GranadeCount/TextureRect

func _ready(): 
	update_color(laser_label, laser_icon, GameEventController.laser_amount)
	update_color(granade_label, granade_icon, GameEventController.granade_count)

func update_color(label: Label, icon: TextureRect, amount: int):
	if amount > 0:
		label.modulate = green
		icon.modulate = green
	else:
		label.modulate = red
		icon.modulate = red


func update_laser_text():
	var amount = GameEventController.laser_amount
	laser_label.text = str(amount)
	update_color(laser_label, laser_icon, amount)


func update_granade_text():
	var amount = GameEventController.granade_count
	granade_label.text = str(amount)
	update_color(granade_label, granade_icon, amount)

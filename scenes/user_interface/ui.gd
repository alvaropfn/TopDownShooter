extends CanvasLayer


@onready var laser_label: Label = $AmmoCounter/HBoxContainer/LaserCount/Label
@onready var granade_label: Label = $AmmoCounter/HBoxContainer/GranadeCount/Label

func update_laser_text():
	laser_label.text = str(GameEventController.laser_amount)


func update_granade_text():
		granade_label.text = str(GameEventController.granade_count)

extends CanvasLayer

var animator

func _ready():
	animator = $AnimationPlayer


func change_scene(new_scene, old_scene) -> void:
	animator.play("fade_to_black")
	await animator.animation_finished
	animator.call_deferred("play", "fade_from_black")
	GameEventController.change_scene(new_scene, old_scene)
	animator.play("fade_from_black")
	await animator.animation_finished

func fadeOut():
	animator.play("fade_to_black")
	await animator.animation_finished

func fadeIn():
	animator.play("fade_from_black")
	await animator.animation_finished

func _on_button_pressed():
	animator.play("fade_to_black")
	await animator.animation_finished
	animator.play("fade_from_black")

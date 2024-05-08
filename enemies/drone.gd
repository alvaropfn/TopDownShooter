extends CharacterBody2D
@export var spd = 200

func _physics_process(_delta):
	var HealthManager = find_child("HealthManager")
	if HealthManager and HealthManager.health > 0:
		velocity = Vector2(1, 0).normalized() * spd
		move_and_slide()


func _on_health_manager_hited():
	print(name, " hited")


func _on_health_manager_entity_die():
	$DroneExplosionAnimation.play("Explosion")


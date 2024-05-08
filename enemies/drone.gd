extends CharacterBody2D


func _on_health_manager_hited():
	print(name, " hited")


func _on_health_manager_entity_die():
	$DroneExplosionAnimation.play("Explosion")


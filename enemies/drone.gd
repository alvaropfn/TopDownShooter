extends CharacterBody2D

func apply_damage(value):
	$HealthManager.apply_damage(value)



func _on_health_manager_entity_die():
	$DroneExplosionAnimation.play("Explosion")

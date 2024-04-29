extends CharacterBody2D

@export var wlk_spd = 400
@export var run_spd = 600
var can_shoot = true
var can_granade = true

var laser_scene: PackedScene = preload("res://ephemeral/lazer.tscn")
var granade_scene: PackedScene = preload("res://ephemeral/granade.tscn")

func _ready():
	pass


func _physics_process(delta):
	handle_rotation(delta)
	handle_movement()
	handle_main_weapon()
	handle_side_weapon()


func handle_rotation(delta):
	var target = (get_global_mouse_position() - global_position).angle()
	var current = global_rotation
	var speed = 0.1
	global_rotation = lerp_angle(current, target, speed)


func handle_movement():
	var direction = Vector2()
	if Input.is_action_pressed("move_up"): direction.y -= 1
	if Input.is_action_pressed("move_right"): direction.x += 1
	if Input.is_action_pressed("move_down"): direction.y += 1
	if Input.is_action_pressed("move_left"): direction.x -= 1
	
	var spd = wlk_spd
	if Input.is_action_pressed("sprint"):
		spd = run_spd
	
	velocity = direction.normalized() * spd
	move_and_slide()


func get_player_direction():
	return (get_global_mouse_position() - position).normalized()


func handle_main_weapon():
	if Input.is_action_pressed("click_primary") and can_shoot:
		can_shoot = false
		$LazerTimer.start()
		
		var nozzle_positions = $NozzleArray.get_children()
		var lazer = laser_scene.instantiate() as RigidBody2D
		var nozzle = nozzle_positions[randi() % nozzle_positions.size()] as Node2D
		var root_scene = get_parent().get_node("./Projectiles")
		
		lazer.position = nozzle.global_position
		lazer.dir = get_player_direction()
		root_scene.add_child(lazer)


func handle_side_weapon():
	if Input.is_action_pressed("click_secondary") and can_granade:
		can_granade = false
		$GranadeTimer.start()
		
		var nozzle = $NozzleArray/Nozzle1
		var granade = granade_scene.instantiate()
		var root_scene = get_parent().get_node("./Projectiles")
		
		granade.position = nozzle.global_position
		granade.dir = get_player_direction()
		root_scene.add_child(granade)


func _on_lazer_timer_timeout():
	can_shoot = true


func _on_granade_timer_timeout():
	can_granade = true

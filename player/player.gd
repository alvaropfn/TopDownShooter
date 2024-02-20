extends CharacterBody2D

@export var wlk_spd = 200
@export var run_spd = 400

var laser_scene: PackedScene = preload("res://ephemeral/lazer.tscn")

func _ready():
	rotate(PI)

func _physics_process(_delta):
	handle_movement()
	handle_main_weapon()


func handle_movement():
	look_at(get_global_mouse_position())
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


func handle_main_weapon():
	if Input.is_action_pressed("click_primary"):
		var nozzle_positions = $NozzleArray.get_children()
		var lazer = laser_scene.instantiate() as RigidBody2D
		var nozzle = nozzle_positions[randi() % nozzle_positions.size()] as Node2D
		var root_scene = get_parent()
		
		lazer.position = nozzle.global_position
		lazer.dir = (get_global_mouse_position() - position).normalized()
		root_scene.add_child(lazer)



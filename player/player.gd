extends CharacterBody2D

@export var walk_speed = 200
@export var sprint_speed = 400

func _ready():
	rotate(PI)

func _physics_process(delta):
	handle_movement()
	handle_rotation()

func handle_movement():
	var direction = Vector2()
	if Input.is_action_pressed("move_up"): direction.y -= 1
	if Input.is_action_pressed("move_right"): direction.x += 1
	if Input.is_action_pressed("move_down"): direction.y += 1
	if Input.is_action_pressed("move_left"): direction.x -= 1
	velocity = direction.normalized() * walk_speed
	move_and_slide()
	
func handle_rotation():
	# update to use rotation instead
	look_at(get_global_mouse_position())
	print(rotation)

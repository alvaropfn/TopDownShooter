extends CharacterBody2D

@export var walk_speed = 200
@export var sprint_speed = 400

func _ready():
	rotate(PI)

func _physics_process(_delta):
	handle_movement()
	handle_rotation()

func handle_movement():
	var direction = Vector2()
	if Input.is_action_pressed("move_up"): direction.y -= 1
	if Input.is_action_pressed("move_right"): direction.x += 1
	if Input.is_action_pressed("move_down"): direction.y += 1
	if Input.is_action_pressed("move_left"): direction.x -= 1
	
	var speed = walk_speed
	if Input.is_action_pressed("sprint"):
		speed = sprint_speed
	
	velocity = direction.normalized() * speed
	move_and_slide()
	
func handle_rotation():
	var mouse_pos= get_global_mouse_position()
	var target_rotation = atan2(mouse_pos.y - global_position.y, mouse_pos.x - global_position.x)
	target_rotation += deg_to_rad(90)
	rotation = target_rotation
	
func handle_main_weapon():
	if Input.is_action_pressed("click_primary"):
		var nozzle_positions = $NozzleArray.get_children()
		
		

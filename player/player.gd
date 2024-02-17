extends CharacterBody2D

@export var speed = 200

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	look_at(get_global_mouse_position())


func _physics_process(delta):
	get_input()

func get_input():
	var direction = Vector2()
	if Input.is_action_pressed("move_up"): direction.y -= 1
	if Input.is_action_pressed("move_right"): direction.x += 1
	if Input.is_action_pressed("move_down"): direction.y += 1
	if Input.is_action_pressed("move_left"): direction.x -= 1
	velocity = direction.normalized() * speed
	move_and_slide()
	

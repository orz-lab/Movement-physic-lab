extends CharacterBody2D

@export var SPEED = 550
@export var JUMP_POWER = -2000

@export var ACCELERATION = 50
@export var FRICTION = 70

@export var GRAVITY = 120

func _ready():
	$editmode/VBoxContainer/Speed/HSlider.value = SPEED
	$"editmode/VBoxContainer/Jump Power/HSlider".value = -JUMP_POWER
	$editmode/VBoxContainer/Acceleration/HSlider.value = ACCELERATION
	$editmode/VBoxContainer/Friction/HSlider.value = FRICTION
	$editmode/VBoxContainer/Gravity/HSlider.value = GRAVITY

func _physics_process(delta):
	movement(delta)
	jump(delta)
	move_and_slide()

func movement(delta):
	var input_direction = Vector2.ZERO
	input_direction.x = Input.get_axis("move_left", "move_right")
	input_direction = input_direction.normalized()
	
	if input_direction != Vector2.ZERO:
		velocity = velocity.move_toward(SPEED * input_direction, ACCELERATION)
	else:
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION)

func jump(delta):
	if is_on_floor() and Input.is_action_just_pressed("jump"):
		velocity.y += JUMP_POWER
	else:
		velocity.y += GRAVITY
	
func _on_speed_on_changed(value):
	SPEED = value

func _on_jump_power_on_changed(value):
	JUMP_POWER = -value

func _on_acceleration_on_changed(value):
	ACCELERATION = value

func _on_friction_on_changed(value):
	FRICTION = value

func _on_gravity_on_changed(value):
	GRAVITY = value

extends CharacterBody2D

@export var max_speed = 700.0
const acceleration = 1200.0 
const friction = 1200.0      
const jump_velocity = -400.0
@export var min_jump_velocity: float = -200.0
@export var air_accel = 10
signal speed


func _physics_process(delta: float) -> void:
	# gravity
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	# Air acceleration
	#TODO scrollhop swag reductor
	if not is_on_floor():
		max_speed += air_accel
	else:
		max_speed = 700.0



# jump
	#TODO 
	# track if jump is good
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jump_velocity
# 2. Variable jump logic
	if Input.is_action_just_released("jump") and velocity.y < min_jump_velocity:
		velocity.y = min_jump_velocity

	# Gets input direction (-1, 0, or 1)
	var direction := Input.get_axis("left", "right")
	
	# Handle acceleration and deceleration
	if direction != 0:
		# Gradually ramp up velocity towards direction * max_speed
		velocity.x = move_toward(velocity.x, direction * max_speed, acceleration * delta)
	else:
		# Gradually slow down to 0
		velocity.x = move_toward(velocity.x, 0, friction * delta)


	move_and_slide()
	speed.emit(velocity)
	

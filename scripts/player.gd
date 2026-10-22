extends CharacterBody2D

var MAX_SPEED = 700.0
const ACCELERATION = 1200.0 # Units per second squared
const FRICTION = 1200.0       # Units per second squared
const JUMP_VELOCITY = -400.0
signal speed


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	# Air acceleration boost
	if not is_on_floor():
		MAX_SPEED = 1000
	else:
		await 1
		MAX_SPEED = 700.0

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Gets input direction (-1, 0, or 1)
	var direction := Input.get_axis("left", "right")
	
	# Handle acceleration and deceleration
	if direction != 0:
		# Gradually ramp up velocity towards direction * MAX_SPEED
		velocity.x = move_toward(velocity.x, direction * MAX_SPEED, ACCELERATION * delta)
	else:
		# Gradually slow down to 0
		velocity.x = move_toward(velocity.x, 0, FRICTION * delta)


	move_and_slide()
	speed.emit(velocity)
	

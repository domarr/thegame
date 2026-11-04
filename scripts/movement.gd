extends CharacterBody2D


signal speed

func _process(delta: float) -> void:
	# value changes go here
	if Globals.champ == "dash":
		Globals.min_jump_velocity = 15
		Globals.air_accel = 0
	# reset
	if Input.is_action_just_pressed("reset"):
		position = Vector2(-300,20)
func _physics_process(delta: float) -> void:
	# gravity
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	# Air acceleration
	#TODO scrollhop swag reductor
	if not is_on_floor():
		Globals.max_speed += Globals.air_accel
	else:
		Globals.max_speed = 700.0

# jump
	#TODO 
	# track if jump is good
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = Globals.jump_velocity
# 2. Variable jump logic
	if Input.is_action_just_released("jump") and velocity.y < Globals.min_jump_velocity:
		velocity.y = Globals.min_jump_velocity

	# Gets input direction (-1, 0, or 1)
	var direction := Input.get_axis("left", "right")
	
	# Handle acceleration and deceleration
	if direction != 0:
		# Gradually ramp up velocity towards direction * max_speed
		velocity.x = move_toward(velocity.x, direction * Globals.max_speed, Globals.acceleration * delta)
	else:
		# Gradually slow down to 0
		velocity.x = move_toward(velocity.x, 0, Globals.friction * delta)
	 #ability handling
	if Input.is_action_just_pressed("ability"):
		#dash
		var can_dash
		if Globals.champ == "dash" and !is_on_floor() and can_dash:
			#TODO needs to be directional
			print("dash")
			velocity += Vector2(300,0)
			
		if is_on_floor():
			can_dash = true

	move_and_slide()
	speed.emit(velocity)

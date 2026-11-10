extends CharacterBody2D

signal speed
signal reset
var can_dash = true
var is_sliding = false
var slide_speed_threshold = 750.0

func _process(delta: float) -> void:
	if Globals.champ == "dash":
		Globals.min_jump_velocity = 15
		Globals.air_accel = 0
		
	if Input.is_action_just_pressed("reset"):
		position = Vector2(-300, 20)
		reset.emit()
		
		
	if is_on_floor():
		can_dash = true
		# If our speed drops back to normal, end the slide state
		if abs(velocity.x) <= Globals.max_speed:
			is_sliding = false

func _physics_process(delta: float) -> void:
	# 1. Gravity
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	# 2. Air acceleration / Max speed management
	if not is_on_floor():
		Globals.max_speed += Globals.air_accel
	elif not is_sliding:
		Globals.max_speed = 700.0

	# 3. Jump logic
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = Globals.jump_velocity
		is_sliding = false # Breaking slide on jump

	if Input.is_action_just_released("jump") and velocity.y < Globals.min_jump_velocity:
		velocity.y = Globals.min_jump_velocity

	# 4. Movement input & Friction
	var direction := Input.get_axis("left", "right")
	
	if is_sliding:
		# While sliding from a dash, apply a much lower friction so you glide smoothly
		var slide_friction = Globals.friction * 0.3 
		velocity.x = move_toward(velocity.x, direction * Globals.max_speed, slide_friction * delta)
	elif direction != 0:
		velocity.x = move_toward(velocity.x, direction * Globals.max_speed, Globals.acceleration * delta)
	else:
		velocity.x = move_toward(velocity.x, 0, Globals.friction * delta)

	# 5. Ability Handling (Dash / Wavedash)
	if Input.is_action_just_pressed("ability"):
		if Globals.champ == "dash" and !is_on_floor() and can_dash:
			print("wavedash / dash")
			var dash_input = Input.get_vector("left", "right", "up", "down")
			var dash_speed = 900.0 
			
			if dash_input != Vector2.ZERO:
				velocity = dash_input.normalized() * dash_speed
			else:
				var facing_dir = 1.0 if velocity.x >= 0 else -1.0
				velocity = Vector2(facing_dir * dash_speed, 0)
				
			can_dash = false
			
			# If you dash downwards toward the floor, trigger the slide state
			if velocity.y > 0:
				is_sliding = true
				Globals.max_speed = abs(velocity.x)

	move_and_slide()
	speed.emit(velocity)


func _on_reset() -> void:
	velocity = Vector2(0,0)

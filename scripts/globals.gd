extends Node
var max_speed = 700.0
var acceleration = 1200.0 
var friction = 1200.0      
var jump_velocity = -400.0
var min_jump_velocity: float = -200.0
var air_accel = 10
var champ = "nada"
var champsel = true # there HAS to be a better to do this
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

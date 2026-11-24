extends Node
var max_speed = 700.0
var acceleration = 1200.0 
var friction = 1200.0      
var jump_velocity = -400.0
var min_jump_velocity: float = -200.0
var air_accel = 10
var champ = "nada"
var champsel = true # there HAS to be a better to do this
var timer: Timer
var time = 0
var level: int
var canmove = false

func _ready() -> void:
	timer = Timer.new()
	timer.wait_time = 1
	timer.autostart = false
	add_child(timer)
	timer.timeout.connect(_on_timer_timeout)
	timer.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_timer_timeout():
	time +=1

func timerstop():
	timer.stop()

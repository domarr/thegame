extends Node


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# value changes go here
	if Globals.champ == "dash":
		Globals.jump_velocity = 200


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_released("ability"):
		pass

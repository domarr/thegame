extends Control

signal champ(champion_name: String) 
var champion

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func on_champ(champ_name: String) -> void:
	champ.emit(champ_name)
	if champ_name == "dash":
		print("hi")

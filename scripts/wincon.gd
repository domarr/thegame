extends Node
#idk why it says node not found these ARE the paths and it DOES work 
@onready var winscreen: Sprite2D = $"../../winscreen/CanvasLayer/winscreen"
@onready var winscreencamera: Camera2D = $"../../winscreen/CanvasLayer/winscreen/winscreen camera"
@onready var playercamera: Camera2D = $"../player/player camera"

func _on_static_body_2d_body_entered(body: Node2D) -> void:
	if body == $"../player":
		print("win condition met")
		winscreen.show_win_screen()
		winscreencamera.on()
		playercamera.off()

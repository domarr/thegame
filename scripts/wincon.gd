extends Node
#throws 3 errors BUTT it works and it breaks when i touch it
#do what you will with this information 
@onready var winscreen: Sprite2D = $"../../winscreen/CanvasLayer/winscreen"
@onready var winscreencamera: Camera2D = $"../../winscreen/CanvasLayer/winscreen/winscreen camera"
@onready var playercamera: Camera2D = $"../player/player camera"

func _on_static_body_2d_body_entered(body: Node2D) -> void:
	if body == $"../player":
		print("win condition met")
		winscreen.show_win_screen()
		winscreencamera.on()
		playercamera.off()

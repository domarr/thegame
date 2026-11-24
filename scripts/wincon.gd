extends Node
#throws 3 errors BUTT it works and it breaks when i touch it
#do what you will with this information 
@onready var winscreen: Sprite2D = $"../../winscreen/CanvasLayer/winscreen"
@onready var winscreencamera: Camera2D = $"../../winscreen/CanvasLayer/winscreen/winscreen camera"
@onready var playercamera: Camera2D = $"../player/player camera"

func _on_static_body_2d_body_entered(body: Node2D) -> void:
	if body == $"../player":
		winscreen.show_win_screen()
		$"../../ui/time".off()
		$"../../ui/speed".off()
		Globals.canmove=false
		print(Globals.canmove)
		Globals.timerstop()
		winscreencamera.on()
		playercamera.off()

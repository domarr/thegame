extends Sprite2D

func show_win_screen() -> void:
	eval()
	visible = true

func eval() -> void:
	if Globals.level == 1 and Globals.time < 5:
		var tex = load("res://assests/winscreen stuff/godlike.png")
		if tex:
			texture = tex

extends Label

func _process(delta: float) -> void:
	text = str(Globals.time)

func _on_player_reset() -> void:
	Globals.time = 0

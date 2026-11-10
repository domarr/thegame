extends Label
var time = 0

func _on_timer_timeout() -> void:
	time = time+1
	text = str(time)


func _on_player_reset() -> void:
	time = 0

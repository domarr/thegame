extends Sprite2D
signal win

func _on_static_body_2d_body_entered(body: Node2D) -> void:
	if body == $"../player":
		win.emit()

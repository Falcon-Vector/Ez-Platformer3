extends Area2D





func _on_body_entered(body: Node2D) -> void:
	if body.name == "player":
		body.timer_running = false
		print("winner")
		get_tree().change_scene_to_file("res://scenes/endgame.tscn")
		

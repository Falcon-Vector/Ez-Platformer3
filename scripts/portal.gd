extends Area2D





func _on_body_entered(body: Node2D) -> void:
	if body.name == "player":
		print("winner")
		#load new scene
		get_tree().change_scene_to_file("res://scenes/endgame.tscn")
		pass

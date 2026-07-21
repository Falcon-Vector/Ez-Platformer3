extends Area2D

var checkpoint_manager

func _ready() -> void:
	print("Checkpoint script is running!")
	checkpoint_manager = get_parent().get_parent().get_node("checkpoint_manager")


func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	print("Checkpoint touched!")
	print("Body name:", body.name)
	print("Groups:", body.get_groups())

	if body.is_in_group("player"):
		print("Checkpoint saved!")
		checkpoint_manager.last_location = $respawn_point.global_position

extends Node2D

@onready var background_main: AudioStreamPlayer = $background_main


func _ready() -> void:
	background_main.play()


func _process(delta: float) -> void:
	pass


func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/level_1.tscn")


func _on_quit_pressed() -> void:
	get_tree().quit()

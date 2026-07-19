extends Area2D

func _on_area_entered(area: Area2D) -> void:
	print("Coin collected!")
	$coinsound.play()
	print("Playing:", $coinsound.playing)

	$Sprite2D.hide()
	$CollisionShape2D.set_deferred("disabled", true)

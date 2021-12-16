extends Area2D

signal collected

func _on_Collectible_2_body_entered(body):
	if body.name == "Player":
		body.points = body.points + 200
		queue_free()
		emit_signal("collected")
		if(body.points == 2000):
			get_tree().paused = true
			get_parent().get_node("../UI/GameOver").show()

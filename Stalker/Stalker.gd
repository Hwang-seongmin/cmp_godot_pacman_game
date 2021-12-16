extends KinematicBody2D

signal lose_health

var speed = 100

onready var obj = get_parent().get_node("Player")

func _physics_process(delta):
	var dir = (obj.global_position - global_position).normalized()
	move_and_collide(dir * speed * delta)


func _on_Area2D_body_entered(body):
	if body.name == "Player":
		body.health = body.health - 1
		emit_signal("lose_health")
		if(body.health == 0):
			get_tree().paused = true
			$"../UI/GameOver".show()


extends Area2D

signal lose_health

export var speed : int = 100
export var moveDist : int = 200
 
onready var startX : float = position.x
onready var targetX : float = position.x + moveDist


func _ready():
	$AnimatedSprite.play("fly")

func _physics_process (delta):
	
	# move to the "targetX" position
	position.x = move_to(position.x, targetX, speed * delta)
 
	# if we're at our target, move in the other direction
	if position.x == targetX:
		if targetX == startX:
			targetX = position.x + moveDist
		else:
			targetX = startX


# moves "current" towards "to" in an increment of "step"
func move_to (current, to, step):
 
	var new = current
 
	# are we moving positive?
	if new < to:
		new += step
 
		if new > to:
			new = to
	# are we moving negative?
	else:
		new -= step
 
		if new < to:
			new = to
 
	return new


func _on_Enemy_body_entered(body):
	if body.name == "Player":
		body.health = body.health - 1
		emit_signal("lose_health")
		if(body.health == 0):
			get_tree().paused = true
			get_parent().get_node("../UI/GameOver").show()

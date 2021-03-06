extends KinematicBody2D

class_name Player

export (int) var speed = 300

var velocity = Vector2()
var points = 0
var health = randi() % 9+1

func get_input():
	
	velocity = Vector2()
	if Input.is_action_pressed("ui_right"):
		velocity.x = speed
	if Input.is_action_pressed("ui_left"):
		velocity.x = -speed
	if Input.is_action_pressed("ui_down"):
		velocity.y = speed
	if Input.is_action_pressed("ui_up"):
		velocity.y = -speed
		
	velocity = velocity.normalized() * speed

func _physics_process(delta):
	get_input()
	velocity = move_and_slide(velocity)

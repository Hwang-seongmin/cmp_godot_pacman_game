extends Node2D

onready var points = $"../Player".points
onready var health = $"../Player".health

func _ready():
	#$PointsLabel.text = String(points)
	$PointsLabel.text = "Points : " + String(points)
	$HealthLabel.text = "Health : " + String(health)
	$GameOver.hide()

func _on_Collectible1_collected():
	_ready()


func _on_Collectible_2_collected():
	_ready()


func _on_Collectible_6_collected():
	_ready()


func _on_Stalker_lose_health():
	_ready()


func _on_Enemy_lose_health():
	_ready()

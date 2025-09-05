extends Area2D

@onready var player = $"../Player"
@onready var easter_egg_teleport_position = $"../EasterEggTeleportPosition"


func _on_body_entered(body):
	player.position = easter_egg_teleport_position.position
	print("Easter Egg Found!!!")

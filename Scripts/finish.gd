extends Area2D

@onready var game_manager = %GameManager



func _on_body_entered(body):
	print("collided with finsh")
	game_manager.end_Game()
	queue_free()

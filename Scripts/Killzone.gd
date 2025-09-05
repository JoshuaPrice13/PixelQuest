extends Area2D

@onready var timer = $Timer
@onready var game_manager = %GameManager
@onready var audio_stream_player_2d = $AudioStreamPlayer2D
@onready var animation_player = $AnimationPlayer

func _on_body_entered(body):
	print("You died!")
	animation_player.play("die")
	Engine.time_scale = 0.4
	body.get_node("CollisionShape2D").queue_free()
	timer.start()

func _on_timer_timeout():
	Engine.time_scale = 1
	#game_manager.reset_Score()
	get_tree().reload_current_scene()




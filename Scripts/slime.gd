extends Node2D

@onready var game_manager = %GameManager
@onready var slime = $"."
@onready var ray_right = $RayRight
@onready var ray_left = $RayLeft
@onready var animation_player = $AnimationPlayer

const SPEED = 60
var direction = 1

func _process(delta):
	if ray_right.is_colliding():
		direction = -1
	if ray_left.is_colliding():
		direction = 1
		
	position.x += direction * SPEED * delta


func _on_area_2d_body_entered(body):
	animation_player.play("Killing")
	print("KILL~~~")
	game_manager.add_kill()
	

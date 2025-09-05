extends Node

var coin = 0
var kills = 0
var myScore = 0

var time_isRunning = 0

@onready var timer = $Timer
@onready var time = $"../Player/Camera2D/Time_Left"
@onready var score = $Score
@onready var start_over_timer = $StarOverTimer
@onready var time_left = $"../Player/Camera2D/Time_Left"

func _ready():
	var coin = 0
	var kills = 0
	var myScore = 0
	
func start_Time():
	time_isRunning += 1
	
func reset_Score():
	var coin = 0
	var kills = 0
	var myScore = 0
	
func add_point():
	coin += 1
	print(coin)
	
func add_kill():
	kills += 1
	print(kills)
	
func end_Game():
	time_left.text = ""
	Engine.time_scale = .5
	print("end game in gm")
	myScore = ( timer.get_time_left() + (5 * coin) + (kills * 3))
	score.text = ("Score: " + (str(int(myScore))) )
	start_over_timer.start()
	
func _on_star_over_timer_timeout():
	Engine.time_scale = 1
	var coin = 0
	var myScore = 0
	get_tree().reload_current_scene()

func _on_timer_timeout():
	end_Game()
	
func _process(delta):
	if (time_isRunning == 1):
		timer.start()
	
	if (timer.get_time_left() != 0):
		time.text = str(int(timer.get_time_left()))
	else:
		time.text = "50"

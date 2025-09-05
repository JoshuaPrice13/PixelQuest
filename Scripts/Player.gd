extends CharacterBody2D


const SPEED = 70.0
const JUMP_VELOCITY = -255.0
const ROLL_VELLOCITY = 20

var isRolling = false

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@onready var player = $"."
@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var ray_cast_2d = $RayCast2D
@onready var game_manager = %GameManager
@onready var collision_shape_2d_2 = $CollisionShape2D2
@onready var enemyArea = $"slime/Area2D"
@onready var jump_sound = $Jump_Sound
@onready var animation_player = $AnimationPlayer

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("Jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		animation_player.play("Jump")

	

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("move_left", "move_right")
	
	if direction != 0:
		game_manager.start_Time()
		
	#flip character
	if direction > 0:
		animated_sprite_2d.flip_h = false
	elif direction < 0:
		animated_sprite_2d.flip_h = true
		
	if is_on_floor():
		if direction == 0:
			animated_sprite_2d.play("Idle")
		else:	
			animated_sprite_2d.play("Run")
	else:
		animated_sprite_2d.play("Jump")
		
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
		
	if not is_on_floor():
		if Input.is_action_just_pressed("roll"):
			if not ray_cast_2d.is_colliding():
				isRolling = true;
				position.x += direction * ROLL_VELLOCITY
				print("Roll worked")
			else:
				print("cannot roll, object obtructing path")
		else: 
			isRolling = false;
		
	if isRolling == true:
		animated_sprite_2d.play("Roll")

	move_and_slide()



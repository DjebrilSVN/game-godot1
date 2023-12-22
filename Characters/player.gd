extends CharacterBody2D

@export var move_speed : float = 100
var aim_directions: Vector2 = Vector2.ZERO  #[0,0]
@onready var anime = $AnimatedSprite2D

func _ready():
	anime.play("idle")

func _physics_process(_delta):
	 
	aim_directions = get_global_mouse_position() - global_position
	aim_directions = aim_directions.normalized()
	if aim_directions.length_squared() > 0:
		rotation = atan2(aim_directions.y,aim_directions.x)
	# Get Input Direction (movement)
	var input_direction = Vector2(
		Input.get_action_strength("right") - Input.get_action_strength("left"),
		Input.get_action_strength("down") - Input.get_action_strength("up")
	)
	
	if Input.get_action_strength("right") != 0 || Input.get_action_strength("left") != 0 || Input.get_action_strength("down") != 0 || Input.get_action_strength("up") != 0:
		anime.play("walk_unarmed")
	else :	anime.play("idle")
	# Velocity
	velocity = input_direction * move_speed
	
	# Gives Player Ability To Move
	move_and_slide() 
	




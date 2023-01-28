extends KinematicBody2D

export var speed = 400
var _velocity = Vector2.ZERO
var _horizontal_direction = 0.0
var _vertical_direction = 0.0

func _physics_process(delta: float) -> void:
	base_player_movement()

# Question - How to assign differnet input keys depending on how many instances of 
# Player()
func base_player_movement():
	_horizontal_direction = (Input.get_action_strength("move_wasd_right") - Input.get_action_strength("move_wasd_left"))
	_vertical_direction = (Input.get_action_strength("move_wasd_down") - Input.get_action_strength("move_wasd_up"))
	
	_velocity.x = _horizontal_direction * speed
	_velocity.y = _vertical_direction * speed
	
	move_and_slide(_velocity)

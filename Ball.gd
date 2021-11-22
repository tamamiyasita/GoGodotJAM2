extends RigidBody2D

onready var sprite := $Sprite
onready var camera := $Camera2D

const CLAMP_VELOCITY = 1700.0

func _process(delta):
	var speed = get_linear_velocity().length()

func _integrate_forces(state):
	var velocity = state.get_linear_velocity()
	if velocity.length() > CLAMP_VELOCITY:
		state.set_linear_velocity(velocity.clamped(CLAMP_VELOCITY))

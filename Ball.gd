extends RigidBody2D

onready var sprite := $Sprite
onready var camera := $Camera2D
onready var ball_energy = 50
onready var buff = 0
onready var ball_value = 5 

const CLAMP_VELOCITY = 1700.0

func _process(delta):
	var speed = get_linear_velocity().length()

func _integrate_forces(state):
	var velocity = state.get_linear_velocity()
	if velocity.length() > CLAMP_VELOCITY:
		state.set_linear_velocity(velocity.clamped(CLAMP_VELOCITY))

func _unhandled_input(event: InputEvent) -> void:
		if Input.is_action_pressed('spn'):
#			applied_force = Vector2(-400,0)
			applied_torque = 400000.0
		if Input.is_action_just_released('spn'):
			applied_force = Vector2(0,0)
		if Input.is_action_pressed('spn2'):
			applied_force = Vector2(400,0)
		if Input.is_action_just_released('spn2'):
			applied_force = Vector2(0,0)


func energy_charge() -> void:
	ball_energy -= 1
	if ball_energy >= 20:
		ball_value = 5
		sprite.modulate.a = 1.0
	elif ball_energy >= 10:
		ball_value = 3
		sprite.modulate.a = 0.15
	elif ball_energy < 10:
		sprite.modulate.a = 0.04
		ball_value = 1 
#
	
	

func _on_Area2D_area_entered(area: Area2D) -> void:
	energy_charge()
	print("ball_energy", ball_energy)

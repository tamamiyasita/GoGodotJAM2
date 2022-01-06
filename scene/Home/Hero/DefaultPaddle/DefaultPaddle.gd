extends Node2D


onready var paddle_r := $PaddleR
onready var paddle_l := $PaddleL
onready var delay_timer := $ChargeTimer
onready var anime := $AnimationPlayer
onready var states := HeroBaseState.new()
onready var Skill = preload('res://scene/Home/Hero/DefaultPaddle/Skill.tscn')

export var paddle_degrees := 10

export var paddle_charge_delay := 3

export var snap_time := 0.2

export var snap_angle := 50

export var ball_add_speed := 0.0

var attack_ready := true
var ball

func change_states() -> Dictionary:
	return {
		"power" : states.attack_power,
		"range" : states.attack_range,
		"sustain" : states.energy_sustain,
		"attribute" : states.attribute,
	}

func _ready() -> void:
	paddle_r.rotation_degrees = paddle_degrees
	paddle_l.rotation_degrees = -paddle_degrees
	anime.play('attack_ready')
	
	

func _on_Paddle_body_entered(body: Node) -> void:
	ball = body as RigidBody2D
	var add_states = change_states()
	if attack_ready:
		var skill = Skill.instance()
		print("test_anime", body.name)
		anime.play('RESET')
		ball.energy_charge(add_states)
		
		ball.skill_ball.add_child(skill)
		

		var v = ball.get_linear_velocity() * ball_add_speed
		#impulseで瞬間的な力を加えられる
		ball.apply_central_impulse(v)
		#forceで継続的な力が加わる
#		ball.add_force(v*1.5,v*1.5)
#		ball.angular_damp = 1
		attack_ready = false
		delay_timer.start(paddle_charge_delay) 
		


func _on_ChargeTimer_timeout() -> void:
	attack_ready = true
	anime.play('attack_ready')
	

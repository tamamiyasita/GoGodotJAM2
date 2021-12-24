extends Node2D


onready var paddle_r := $PaddleR
onready var paddle_l := $PaddleL
onready var delay_timer := $ChargeTimer
onready var anime := $AnimationPlayer
onready var states := $States

export var paddle_degrees := 10

export var delay := 3
var attack_ready := true

export var snap_time := 0.55

export var snap_angle := 50


func change_states() -> Dictionary:
	return {
		"power" : states.attack_power,
		"range" : states.attack_range,
		"duration" : states.duration,
		"attribute" : states.attribute,
	}

func _ready() -> void:
	paddle_r.rotation_degrees = paddle_degrees
	paddle_l.rotation_degrees = -paddle_degrees
	anime.play('attack_ready')
	
	

func _on_Paddle_body_entered(body: Node) -> void:
	var paddle = body
	if attack_ready:
		print("test_anime", body.name)
		anime.play('RESET')
		paddle.states = states
		paddle.on_energy = true
		attack_ready = false
		delay_timer.start(delay) 
		


func _on_ChargeTimer_timeout() -> void:
	attack_ready = true
	anime.play('attack_ready')

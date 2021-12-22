extends Node2D


onready var paddle_r := $PaddleR
onready var paddle_l := $PaddleL
onready var states := $States
onready var delay_timer := $ChargeTimer
onready var anime := $AnimationPlayer

export var paddle_degrees := 10

export var delay := 3
var attack_ready := true

export var snap_time := 0.55

export var snap_angle := 50

func _ready() -> void:
	paddle_r.rotation_degrees = paddle_degrees
	paddle_l.rotation_degrees = -paddle_degrees
	anime.play('attack_ready')
	
	

func _on_Paddle_body_entered(body: Node) -> void:
	if attack_ready:
		anime.play('RESET')
		body.states = states
		body.on_energy = true
		attack_ready = false
		delay_timer.start(delay) 
		


func _on_ChargeTimer_timeout() -> void:
	attack_ready = true
	anime.play('attack_ready')

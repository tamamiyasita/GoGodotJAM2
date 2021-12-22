extends Node2D


onready var paddle_r := $PaddleR
onready var paddle_l := $PaddleL
onready var states := $States
onready var delay_timer := $ChargeTimer
onready var anime := $AnimationPlayer

export var delay := 3
var attack_ready := true



func _ready() -> void:
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

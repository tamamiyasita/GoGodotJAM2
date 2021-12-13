extends Node2D

export(PackedScene) var Fire
onready var rigid_body := $RigidBody2D
onready var muzzle := $Muzzle
onready var anime := $AnimationPlayer


var ball

var energy := 0
var energy_consumption := 3

func _ready() -> void:
	set_process(false)
	
func _process(delta: float) -> void:
	if energy > 0 and is_instance_valid(ball):
		muzzle.look_at(ball.global_position)

	else:
		anime.play('RESET')
		set_process(false)
		






func ball_energy_charge(body) -> void:
	if body.is_in_group("ball"):
		ball = body
		energy += BaseInfo.ball_value
		BaseInfo.ball_energy -= energy_consumption
		fire(energy)
		anime.play('on')
		set_process(true)
	if energy > 0:
		pass







func fire(value)->void:
	var fire = Fire.instance()
	$Muzzle/shotPos.add_child(fire)
	fire.timer_set(value)
	$Timer.start(1.4)
#	energy -= 3
#	if energy < 0:
#		energy = 0
#	yield(get_tree().create_timer(0.5), "timeout")
#	set_process(true)
	print(energy, "  eneger")



func _on_Area2D_body_entered(body: Node) -> void:
	ball_energy_charge(body)




func _on_Timer_timeout() -> void:
	if energy > 0:
		energy -= 1
		$Timer.start(1.7)
	else:
		set_process(false)
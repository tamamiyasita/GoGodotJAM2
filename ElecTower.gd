extends Node2D

onready var rigid_body := $RigidBody2D
onready var muzzle := $Muzzle
export(PackedScene) var Fire
var ball

var energy := 0
var energy_consumption := 3

func _ready() -> void:
	set_process(false)
	
func _process(delta: float) -> void:
	if energy > 2:
		muzzle.look_at(ball.global_position)

	else:
		set_process(false)






func ball_energy_charge(body) -> void:
	if body.is_in_group("ball"):
		ball = body
		energy += body.ball_value
		body.ball_energy -= energy_consumption
		fire()
		set_process(true)
	if energy > 0:
		pass







func fire()->void:
	var fire = Fire.instance()
	$Muzzle/shotPos.add_child(fire)
#	energy -= 3
#	if energy < 0:
#		energy = 0
#	yield(get_tree().create_timer(0.5), "timeout")
#	set_process(true)
	print(energy, "  eneger")



func _on_Area2D_body_entered(body: Node) -> void:
	ball_energy_charge(body)

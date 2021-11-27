extends Node2D

onready var rigid_body := $RigidBody2D
export(PackedScene) var Fire

var energy := 0
var energy_consumption := 3

func _ready() -> void:
	set_process(false)
	
func _process(delta: float) -> void:
	if energy > 2:
		fire()
		set_process(false)
	else:
		$AnimationPlayer.play('RESET')
		set_process(false)






func ball_energy_charge(body) -> void:
	if body.is_in_group("ball"):
		energy += BaseInfo.ball_value
		BaseInfo.ball_energy -= energy_consumption
		set_process(true)
	if energy > 0:
		$AnimationPlayer.play('hit')







func fire()->void:
	var fire = Fire.instance()
	$Position2D.add_child(fire)
	energy -= 3
	if energy < 0:
		energy = 0
	yield(get_tree().create_timer(0.5), "timeout")
	set_process(true)
	print(energy, "  eneger")



func _on_Area2D_body_entered(body: Node) -> void:
	ball_energy_charge(body)

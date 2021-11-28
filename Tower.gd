extends Node2D

onready var rigid_body := $RigidBody2D
onready var particle := $Particles2D
onready var canon := $Cannon
export(PackedScene) var Fire

var energy := 0
var energy_consumption := 3
var start_fire := 4

func _ready() -> void:
	$AnimationPlayer.play('r')
#	set_process(false)
#
#func _process(delta: float) -> void:
#	if energy > 2:
#		fire()
#		set_process(false)
#	else:
#		$AnimationPlayer.play('RESET')
#		set_process(false)






func ball_energy_charge(body):
	if body.is_in_group("ball"):
		
		energy += BaseInfo.ball_value
		BaseInfo.ball_energy -= energy_consumption
		start_fire -= 1
		particle.scale *= 1.3
		if start_fire <= 0:
			$Particles2D2.emitting = true
			$Particles2D3.emitting = true
			$AnimationPlayer.play('f')
			yield($AnimationPlayer, "animation_finished" )
			particle.scale = Vector2(1.45, 1.45)
			canon.shoot(energy+3)
			start_fire = 1

			
			energy -= 3
			if energy < 0:
				energy = 0
				return
			
#			set_process(true)
	if energy > 0:
		$AnimationPlayer.play('hit')







#func fire()->void:
#	var fire = Fire.instance()
#	$Position2D.add_child(fire)
#	energy -= 3
#	if energy < 0:
#		energy = 0
#	yield(get_tree().create_timer(0.5), "timeout")
#	set_process(true)
#	print(energy, "  eneger")



func _on_Area2D_body_entered(body: Node) -> void:
	ball_energy_charge(body)

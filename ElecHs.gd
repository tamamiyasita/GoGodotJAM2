extends Node2D

export(PackedScene) var Fire
onready var rigid_body := $RigidBody2D
onready var muzzle := $Muzzle
onready var anime := $AnimationPlayer


var enemy

var energy := 0
var energy_consumption := 3

func _ready() -> void:
	set_process(false)
	
func _process(delta: float) -> void:
	if energy > 0 and is_instance_valid(enemy):
		muzzle.look_at(enemy.global_position)

	elif energy <= 0:
		get_parent().move_switch(false)
		anime.play('RESET')
		set_process(false)
		






func ball_energy_charge(body) -> void:
	if body.is_in_group("ball"):
		energy += BaseInfo.ball_value
		BaseInfo.ball_energy -= energy_consumption
#		fire(energy)
		anime.play('on')
		set_process(true)
		get_parent().move_switch(true)
	if energy > 0:
		pass







func fire(value)->void:
	var fire = Fire.instance()
	$Muzzle/shotPos.add_child(fire)
	fire.timer_set(value)
	$Timer.start(1)
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
		$Timer.start(1)
	else:
		set_process(false)




func _on_FireArea2D2_area_entered(area: Area2D) -> void:
	print(area, "area?")
	if energy > 0:
		if area.is_in_group("damage"):
			return
		else:
			enemy = area
			fire(1)

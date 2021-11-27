extends Node2D
export(PackedScene) var Bullet

export var muzzle_velocity = 350
export var gravity = 250


onready var muzzle := $Muzzle/shotPos

var energy := 0
var energy_consumption := 2

func _ready() -> void:
	set_process(false)
	
func _process(delta: float) -> void:
	if energy > 0:
		shoot()
		set_process(false)
	else:
		$AnimationPlayer2.play('RESET')
		$AnimationPlayer.stop()
		set_process(false)


func ball_energy_charge(body) -> void:
	if body.is_in_group("ball"):
		energy += BaseInfo.ball_value
		BaseInfo.ball_energy -= energy_consumption
		set_process(true)
	if energy > 0:
		$AnimationPlayer2.play('lighit')
		$AnimationPlayer.play('move')
	



func _on_Area2D_body_entered(body: Node) -> void:
	ball_energy_charge(body)


func shoot():
	energy -= 1
	if energy < 0:
		energy = 0
	for i in range(3):
		var b = Bullet.instance()
		muzzle.add_child(b)
		b.transform = muzzle.global_transform
		b.velocity = b.transform.x * muzzle_velocity
		b.gravity = gravity
		yield(get_tree().create_timer(0.3), "timeout")
	set_process(true)


func _unhandled_input(event: InputEvent) -> void:
		if Input.is_action_pressed('shot'):
			shoot()

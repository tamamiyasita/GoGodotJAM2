class_name ball
extends RigidBody2D

const CLAMP_VELOCITY = 1700.0#ball最大速度

export var in_energy := false

onready var ball_sprite := $BallSprite
onready var timer := $DurationTimer
onready var attack_range := $CollisionShape2D

var attack_power := 1.0
var attribute := "Blank"






func energy_charge(dict):
	in_energy = true
	attack_power = dict["power"]
	attack_range.scale *= dict["range"]
	attribute = dict["attribute"]
	timer.start(dict["sustain"])
	print("atk=", attack_power, " range= ", attack_range.scale)
	
#
func _integrate_forces(state):
	##速度の上限を設定する
	var velocity = state.get_linear_velocity()
	if velocity.length() > CLAMP_VELOCITY:
		state.set_linear_velocity(velocity.clamped(CLAMP_VELOCITY))


func _on_Ball_body_entered(body: Node) -> void:
	if body.name in "Paddle":
		print("paddle atach")


func _on_DurationTimer_timeout() -> void:
	in_energy = false
	attack_power = 1.0
	attack_range.scale = Vector2.ONE
	attribute = "Blank"




func _ready() -> void:
	pass
#	get_tree().call_group("ui", "update_en", BaseInfo.ball_energy)
#	get_tree().call_group("ui", "update_max_en", BaseInfo.ball_energy)
	

#func update_max_ball_en(value) -> void:
#	BaseInfo.max_ball_energy += value
#	get_tree().call_group("ui", "update_max_en", BaseInfo.max_ball_energy)
#	yield(get_tree().create_timer(0.1), "timeout")
#	get_tree().call_group("ui", "update_en", BaseInfo.ball_energy)
#	enegy_modulate()
	
#func _process(delta):
#	var speed = get_linear_velocity().length()

func _unhandled_input(event: InputEvent) -> void:
		if Input.is_action_pressed('spn'):
#			applied_force = Vector2(-400,0)
			applied_torque = 400000.0
		if Input.is_action_just_released('spn'):
			applied_force = Vector2(0,0)
		if Input.is_action_pressed('spn2'):
			applied_force = Vector2(400,0)
		if Input.is_action_just_released('spn2'):
			applied_force = Vector2(0,0)


#func enegy_modulate() -> void:
#	if BaseInfo.ball_energy >= 20:
#		BaseInfo.ball_value = 5
#		sprite.modulate.a = 1.0
#	elif BaseInfo.ball_energy >= 10:
#		BaseInfo.ball_value = 3
#		sprite.modulate.a = 0.18
#	elif BaseInfo.ball_energy >= 1:
#		sprite.modulate.a = 0.06
#		BaseInfo.ball_value = 1 
#	elif BaseInfo.ball_energy < 1:
#		sprite.modulate.a = 0.0
#		BaseInfo.ball_value = 0



#func energy_charge(obj) -> void:
#	if obj.is_in_group("mob"):
#		$mob.play()
#		BaseInfo.ball_energy -= 1
#		if BaseInfo.ball_energy < 0:
#			BaseInfo.ball_energy = 0
#	if obj.is_in_group("tower"):
#		$charge.play()
			
#	enegy_modulate()


#
#
#	yield(get_tree().create_timer(0.1), "timeout")
#	get_tree().call_group("ui", "update_en", BaseInfo.ball_energy)
	
#
#func _on_Area2D_area_entered(area: Area2D) -> void:
#	energy_charge(area)


#func home() -> void:
##	queue_free()
#	$AnimationPlayer.play('rtn')



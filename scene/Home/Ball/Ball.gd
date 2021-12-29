class_name ball
extends RigidBody2D

const CLAMP_VELOCITY = 1700.0#ball最大速度

export var in_energy := false

onready var ball_sprite := $BallSprite
onready var timer := $DurationTimer
onready var attack_range := $CollisionShape2D

var attack_power := 1.0
var attribute := "Blank"


func _physics_process(delta):
	get_spirograph()



func get_spirograph():
	set_physics_process(false)
#	var x = []
#	var y = []
#	for idx in range(100):
#		var n = 50000
#		var h = 100000
#		yield(get_tree().create_timer(0.01), "timeout")
#		position.x += func_x(t_radian(idx),n,h)*5
#		position.y += func_y(t_radian(idx),n,h)*5
	
	yield(get_tree().create_timer(.1), "timeout")
	position.x += func_x(t_radian(position.x),50000,100000)*5
	position.y += func_y(t_radian(position.y),50000,100000)*5
	set_physics_process(true)


func func_x(t,n,h):
	var ans = 0
	ans = ((n-1)*cos(t) + h*cos((n-1)*t))/n 
	return ans

func func_y(t,n,h):
	var ans = 0
	ans = ((n-1)*sin(t) + h*sin((n-1)*t))/n 
	return ans

func t_radian(index):
	var rad = 0
	var devide_point = 720
	rad = (index*2*PI)/devide_point
	return rad














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
	get_spirograph()
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



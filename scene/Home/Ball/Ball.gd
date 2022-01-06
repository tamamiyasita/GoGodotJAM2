class_name ball
extends RigidBody2D

const CLAMP_VELOCITY = 1700.0#ball最大速度

export var in_energy := false

onready var ball_sprite := $BodySprite
onready var timer := $DurationTimer
onready var attack_range := $CollisionShape2D
onready var skill_ball := $SkillBall

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
	if "Paddle" in body.name:
		print("paddle atach")


func _on_DurationTimer_timeout() -> void:
	in_energy = false
	attack_power = 1.0
	attack_range.scale = Vector2.ONE
	attribute = "Blank"


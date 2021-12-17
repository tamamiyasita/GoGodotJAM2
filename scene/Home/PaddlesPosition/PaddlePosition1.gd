extends Position2D

export(PackedScene) var Hero


func _ready() -> void:
	#paddleの種類をインスタンスとして持つ
	var hero = Hero.instance()
	hero.position = Vector2.ZERO
	add_child(hero)


export var keycode = "ui_left"



export var snap_time := 0.50

export var snap_angle := 50

var intermediate_time := 0.0

const damage = 100

func _physics_process(delta):
#	if Input.is_action_just_pressed(keycode):
#		$AudioStreamPlayer.play()
	if Input.is_action_pressed(keycode):
		if intermediate_time < snap_time:
			intermediate_time += delta
			if intermediate_time > snap_time:
				intermediate_time = snap_time
			set_rotation_degrees((intermediate_time / snap_time) * snap_angle)
	else:
		if intermediate_time > 0:
			intermediate_time -= delta
			if intermediate_time < 0:
				intermediate_time = 0
			set_rotation_degrees((intermediate_time / snap_time) * snap_angle)

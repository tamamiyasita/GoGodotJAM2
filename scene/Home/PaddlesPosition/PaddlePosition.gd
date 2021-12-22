extends Position2D

export(PackedScene) var Hero

var keycode = "paddle_1"

var snap_time := 0.70

var snap_angle := 30

var intermediate_time := 0.0


const damage = 100



func _ready() -> void:
	#paddleの種類をインスタンスとして持つ
	var hero = Hero.instance()
	snap_time = hero.snap_time
	if keycode == "paddle_1" or keycode == "paddle_2":
		snap_angle = -hero.snap_angle
		var l = hero.get_node("PaddleL")
		l.queue_free()
	elif keycode == "paddle_3" or keycode == "paddle_4":
		snap_angle = hero.snap_angle
		var r = hero.get_node("PaddleR")
		r.queue_free()
	add_child(hero)
#	if keycode == "paddle_3" or keycode == "paddle_4":
#		add_child(hero.get_child(0))
#		hero.paddle_r.position = Vector2.ZERO
#	else:
#		add_child(hero.paddle_l)
#		add_child(hero.get_node("PaddleR"))
#		hero.paddle_l.position = Vector2.ZERO

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

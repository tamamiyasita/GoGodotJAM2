extends Path2D

var speed := 40.0

export var _navi_path : NodePath
export var _home_path : NodePath
export(PackedScene) var Enemy
export var follower_num := 5

onready var follower := $PathFollow2D/Follower
onready var navigator : Navigation2D = get_node(_navi_path)
onready var home = get_node(_home_path)

onready var enemy_body = $PathFollow2D/BodyArea2D

onready var path_flollow := $PathFollow2D

onready var timer :Timer = $PathFollow2D/Timer
onready var tween :Tween = $PathFollow2D/Tween

onready var anime :AnimationPlayer= $PathFollow2D/BodyArea2D/AnimationPlayer

onready var states := $BlueSlimeStates

#var h

func _ready():
	if follower_num:
		for i in range(follower_num):
			var enemy = Enemy.instance()
			if i == 0:
				enemy.is_leader = true
				enemy.global_position = Vector2.ZERO
				follower.add_child(enemy)
			else:
				follower.add_child(enemy)
				var d = rand_range(-200, 200)
				var p = rand_range(-200, 200)
				enemy.global_position = Vector2(d,p)
		follower.set_process(true)
	
func _process(_delta):
	pass
	#test
#	h = get_global_mouse_position()

#func flip_change(body):
#	if body.global_position.x < enemy_body.global_position.x:
#		$PathFollow2D/BodyArea2D/Icon.flip_h = true
#	else:
#		$PathFollow2D/BodyArea2D/Icon.flip_h = false

func _on_Timer_timeout():
	home = get_node(_home_path)
	print(home.global_position)
#	flip_change(home)

	curve.clear_points()
	for point in navigator.get_simple_path(path_flollow.position, home.global_position):
		curve.add_point(point)
	var _t = tween.interpolate_property(path_flollow, "unit_offset",
							   0.0, 1.0, curve.get_baked_length() / speed)
	print(_t, " T")
	var _s = tween.start()
	print(_s, " S")
	timer.start()



#func _on_AttackArea2D2_body_entered(body):
#	if body.name == "HomeBody":
#		anime.play("attack")
#		yield(anime, "animation_finished" )
		

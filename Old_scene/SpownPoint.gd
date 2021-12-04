extends Node

export (int) var mob_num := 0
export (float) var pop_time := 2.0

export(PackedScene) var Mob
export(Curve2D) var curve

onready var path := $Path2D
onready var timer := $Timer


func _ready() -> void:
	randomize()
	pop_time += rand_range(-1.5, 1.5)
	timer.wait_time = pop_time
	timer.start()
	get_tree().call_group("ui", "enemies_number", mob_num)





func _on_Timer_timeout() -> void:
	
	if 0 >= mob_num:
		timer.stop()
		print("mob_stop")
	else:
		mob_num -= 1
		var m = Mob.instance()
		path.add_child(m)
		m.h_offset += randi() % 40
		m.v_offset += randi() % 40
		timer.start()
	
	

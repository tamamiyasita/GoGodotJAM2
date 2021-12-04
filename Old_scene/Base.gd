extends KinematicBody2D
export var SPEED := 4.0

export var MAX_HP = 10
var HP = 10

func _ready() -> void:
	HP = MAX_HP
	update_base_max_hp(0)
	set_physics_process(false)

func _physics_process(delta):
	var vel = Vector2.LEFT
	vel = vel * SPEED
	vel = move_and_collide(vel)
	yield(get_tree().create_timer(.7), "timeout")
	set_physics_process(false)


func update_base_max_hp(value) -> void:
	MAX_HP += value
	HP += value
	get_tree().call_group("ui", "update_max_hp", MAX_HP)
	yield(get_tree().create_timer(0.1), "timeout")
	get_tree().call_group("ui", "update_hp", HP)
	

func update_base_hp(value) -> void:
	HP += value
	yield(get_tree().create_timer(0.1), "timeout")
	get_tree().call_group("ui", "update_hp", HP)
	
	
	



func _on_Area2D_area_entered(area: Area2D) -> void:
	if area.is_in_group("BOSS"):
		print("game_over") 
		get_tree().call_group("up", "game_over")	
			
	else:
		area.get_parent().hp -= 5
		yield(get_tree(), "idle_frame")
		area.get_parent()._damege_flash()
		$AudioStreamPlayer.play()
		HP -= area.get_parent().damage
		if 1 > HP:
			print("game_over") 
			get_tree().call_group("up", "game_over")
		get_tree().call_group("ui", "update_hp", HP)


func _on_WalkTimer_timeout():
	set_physics_process(true)

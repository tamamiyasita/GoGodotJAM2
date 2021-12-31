extends Node

const SAVE_FILE = "user://save.ini"

var bar_positions : PoolVector2Array



func _ready() -> void:
	get_tree().call_group("bars", "get_bar_position")
	
	

func save_data() -> void:
	var file = File.new()
	file.open(SAVE_FILE, File.WRITE)
	file.store_var(bar_positions)
#	file.store_var(c, true)
	file.close()

func load_data() -> void:
	var file = File.new()
	if file.file_exists(SAVE_FILE):
		file.open(SAVE_FILE, File.READ)
		var c = file.get_var(true)
		print(c)
		file.close()

func _unhandled_input(_event: InputEvent) -> void:
		if Input.is_action_pressed('shot'):
			save_data()
		elif Input.is_action_just_pressed('load'):
			load_data()
#			print(c.hp)
#			c.say_s()

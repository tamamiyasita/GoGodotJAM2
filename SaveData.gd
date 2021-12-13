extends Node

const SAVE_FILE = "user://save.ini"

var bar_positions : PoolVector2Array



func save_data() -> void:
	get_tree().call_group("bars", "get_bar_position")
	var file = File.new()
	file.open(SaveData.SAVE_FILE, File.WRITE)
	file.store_var(bar_positions)
	file.close()


func _unhandled_input(event: InputEvent) -> void:
		if Input.is_action_pressed('shot'):
			save_data()

extends Node2D
export(PackedScene) var Chest
onready var chest_pos := $ChestPosition2D
onready var timer := $Timer

func _ready() -> void:
	timer.start()


func _on_Timer_timeout() -> void:
	var c = Chest.instance()
	chest_pos.add_child(c)
	timer.stop()

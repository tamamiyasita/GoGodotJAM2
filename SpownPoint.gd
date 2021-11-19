extends Node

export(PackedScene) var Mob

onready var timer := $Timer

func _ready() -> void:
	pass


func _on_Timer_timeout() -> void:
	var m = Mob.instance()
	add_child(m)
	timer.start(1)

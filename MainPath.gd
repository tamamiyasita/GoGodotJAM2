extends Node

onready var home = get_node("/root/Main/Level/Home/PathFollow2D").find_node("HomeBody")
onready var navi2d = get_node("/root/Main/Level").find_node("Navigation2D")

func _ready():
	pass

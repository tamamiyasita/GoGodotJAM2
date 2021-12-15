extends Position2D

export(PackedScene) var Hero


func _ready() -> void:
	var hero = Hero.instance()
	hero.position = Vector2.ZERO
	add_child(hero)

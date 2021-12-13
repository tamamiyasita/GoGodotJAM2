extends Node2D

func _ready() -> void:
	var s = get_tree().call_group("_bars", "get_bar_position")
#	print(get_bar_position())

func get_bar_position():
	var pos=[] #:PoolVector2Array = []
	for p in get_children():
		pos.append(p.position)
	SaveData.bar_positions = pos

	

			

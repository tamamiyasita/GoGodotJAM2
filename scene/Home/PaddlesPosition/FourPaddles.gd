extends Node2D

func _ready() -> void:
	#paddleの位置をloadする
	get_tree().call_group("bars", "get_bar_position")

func get_bar_position():
	var pos=[] #:PoolVector2Array = []
	for p in get_children():
		pos.append(p.position)
	SaveData.bar_positions = pos

	

			

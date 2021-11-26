extends Control
#
onready var HP_label = $VBoxContainer/HBoxContainer/HPLabel
onready var HP_progress = $VBoxContainer/HBoxContainer/HPProgress

onready var EN_label = $VBoxContainer/HBoxContainer2/ENTextLabel
onready var EN_progress = $VBoxContainer/HBoxContainer2/ENProgress

onready var ENEM_label = $VBoxContainer/HBoxContainer3/ENTextLabel
onready var ENEM_progress = $VBoxContainer/HBoxContainer3/ENProgress

var enemies_count = 0
#var nax_ball_energy = 0

func _ready() -> void:
	ENEM_progress.max_value = enemies_count
	pass

func update_en(value) -> void:
	EN_label.bbcode_text =  " Ball Energy " + str(value)
	EN_progress.value = value
	

func update_hp(value) -> void:
	HP_label.bbcode_text = " Base HP " + str(value)
	HP_progress.value = value

func update_max_hp(value) -> void:
	HP_progress.max_value = value
	
func update_max_en(value) -> void:
	EN_progress.max_value = value

func enemies_number(value) -> void:
	enemies_count += value
	ENEM_label.bbcode_text = " Enemies " + str(enemies_count)
	ENEM_progress.value = enemies_count

func update_enemies() -> void:
	enemies_count -= 1
	ENEM_label.bbcode_text = " Enemies " + str(enemies_count)
	ENEM_progress.value = enemies_count
	if 1 > enemies_count:
		print("wave_clear")
		get_tree().call_group("level", "level_change")

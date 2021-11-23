extends Control
#
onready var HP_label = $VBoxContainer/HBoxContainer/HPLabel
onready var HP_progress = $VBoxContainer/HBoxContainer/HPProgress

onready var EN_label = $VBoxContainer/HBoxContainer2/ENTextLabel
onready var EN_progress = $VBoxContainer/HBoxContainer2/ENProgress


func _ready() -> void:
	pass

func update_en(value) -> void:
	EN_label.bbcode_text =  " Ball Energy " + str(value)
	EN_progress.value = value
	

func update_hp(value) -> void:
	HP_label.bbcode_text = " Base HP " + str(value)
	HP_progress.value = value

func update_max_hp(value) -> void:
	HP_progress.max_value = value

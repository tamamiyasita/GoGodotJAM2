extends Area2D

onready var energy_bar := $TextureProgress
onready var sprite := $Sprite
onready var anime := $AnimationPlayer
onready var ball := $FakeBall

var on_ball := true
var player

func _ready() -> void:
	set_process(false)
	ball.hide()

func return_ball() -> void:
	on_ball = true
	ball.show()

func _on_Generator_body_entered(body: Node) -> void:
	player = body
	print("player_on")
	if on_ball:
		ball.show()
		player.hide()
		anime.play('power_on')
		set_process(true)
		

func _process(delta: float) -> void:
	energy_bar.value += .7
	ball.sprite.modulate.a += .003
	if energy_bar.value == energy_bar.max_value:
		get_tree().call_group("hammer", "shot")
		energy_bar.value = 0
		anime.play('power_off')
		set_process(false)
		on_ball = false
		ball.sprite.modulate.a = 0
		ball.hide()
		player.show()

		


func _on_Generator_body_exited(body: Node) -> void:
	player = body
	player.show()
	anime.play('power_off')
	set_process(false)

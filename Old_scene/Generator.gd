extends Area2D

onready var energy_bar := $TextureProgress
onready var sprite := $Sprite
onready var anime := $AnimationPlayer
onready var ball := $FakeBall

var on_ball := true
var player

func _ready() -> void:
	set_process(false)
#	ball.hide()
	ball.sprite.modulate.a = 0

func return_ball() -> void:
	on_ball = true
	ball.show()

func _on_Generator_body_entered(body: Node) -> void:
	player = body
	print("player_on")
	if on_ball:
		ball.show()
		player.sprite.hide()
		anime.play('power_on')
		set_process(true)
		$AudioStreamPlayer.play()

func _process(delta: float) -> void:
	energy_bar.value += 1.9
	ball.sprite.modulate.a += .016
	player.speed = 0
	if energy_bar.value == energy_bar.max_value:
		BaseInfo.ball_energy = BaseInfo.max_ball_energy
		get_tree().call_group("hammer", "shot")
		energy_bar.value = 0
		anime.play('power_off')
		set_process(false)
		player.speed = 470
		on_ball = false
		ball.sprite.modulate.a = 0
		ball.hide()
		player.sprite.show()

		


func _on_Generator_body_exited(body: Node) -> void:
	player = body
#	player.sprite.show()
#	anime.play('power_off')
#	set_process(false)
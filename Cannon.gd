extends Node2D
export(PackedScene) var Bullet

export var muzzle_velocity = 350
export var gravity = 250


onready var muzzle := $Muzzle/shotPos

func _ready() -> void:
	pass



func _on_Area2D_body_entered(body: Node) -> void:
	shoot()


func shoot():
	for i in range(3):
		var b = Bullet.instance()
		muzzle.add_child(b)
		b.transform = muzzle.global_transform
		b.velocity = b.transform.x * muzzle_velocity
		b.gravity = gravity
		yield(get_tree().create_timer(0.3), "timeout")


func _unhandled_input(event: InputEvent) -> void:
		if Input.is_action_pressed('shot'):
			shoot()

extends Area2D

export var RULE_1_COEF := 00.1
export var RULE_2_COEF := 2.1
export var RULE_3_COEF := 0.2
export var FOV := 20
export var MAX_SPEED = 40

var vel := Vector2.ZERO
var acc := Vector2.ZERO

func _ready() -> void:
	pass # Replace with function body.


func update_vel(followers):
	var vec1 = rule1(followers) 
	var vec2 = rule2(followers) 
	var vec3 = rule3(followers)
	print(vec1, vec2, vec3, " vec")
	acc = vec1 + vec2 + vec3


func update_pos() -> void:
	vel += acc
	if vel.length() > MAX_SPEED:
		vel /= vel.length() / MAX_SPEED
	position += vel


func rule1(followers) -> Vector2:
	var vector = Vector2.ZERO
	for b in followers:
		vector += b.position
	vector /= followers.size()
	return (vector - position) * RULE_1_COEF


func rule2(followers) -> Vector2:
	var vector = Vector2.ZERO
	for b in followers:
		if b == self:
			continue
		print(b.position, position)
		var dist = (b.position - position).length()
		if dist == 0:
			dist = 1
		print(Vector2(100,100).length())
		if dist <= FOV:
			vector += (position - b.position)/dist
	return vector * RULE_2_COEF


func rule3(followers):
	var vector = Vector2.ZERO
	for b in followers:
		vector += b.vel
	vector /= followers.size()
	return (vector - vel) * RULE_3_COEF









	

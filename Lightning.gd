extends RayCast2D

onready var line := $Line2D
onready var end := $End

var max_distance := 800

func _ready() -> void:
	cast_to = Vector2(max_distance, 0)

func _physics_process(delta: float) -> void:
	if is_colliding():
		var coll_point = to_local(get_collision_point())
		line.points[1].x = coll_point.x
		end.position.x = coll_point.x

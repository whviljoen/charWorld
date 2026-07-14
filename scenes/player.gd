extends KinematicBody2D

func get_random_angle():
	var rand_angle = rand_range(0.0, TAU)
	return rand_angle

func _ready():
	pass
	
var velocity = Vector2.ZERO
func _physics_process(delta):
	var direction = Vector2.RIGHT.rotated(get_random_angle())
	velocity = move_and_slide(direction * 10)

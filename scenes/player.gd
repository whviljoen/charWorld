extends KinematicBody2D

var direction = Vector2.ZERO
var degrees = 0

var moveMode = true

func get_random_angle():
	var rand_angle = rand_range(0.0, TAU)
	return rand_angle

func _ready():
	randomize()
	
var velocity = Vector2.ZERO

func _physics_process(delta):
	
	velocity = move_and_slide(direction * 10)

func _on_Timer_timeout():
	$AnimatedSprite.flip_h = 0
	if moveMode == false:
		degrees = get_random_angle()
		print(degrees)
		direction = Vector2.RIGHT.rotated(degrees)
		$AnimatedSprite.play("walk")
		if degrees > 2.355 and degrees < 3.925:
			$AnimatedSprite.flip_h = 1
		if degrees > 3.925 and degrees < 5.498:
			$AnimatedSprite.play("walk_up")
		if degrees > 0.785 and degrees < 2.355:
			$AnimatedSprite.play("walk_down")
		moveMode = true
	else:
		direction = Vector2.ZERO
		$AnimatedSprite.play("idle")
		moveMode = false

func _on_Area2D_area_entered(area):
	direction = direction * -1
	if degrees > 3.14:
		degrees -= 3.14
		print(degrees)
		if degrees > 5.498 or degrees < 0.785:
			$AnimatedSprite.play("walk")
			$AnimatedSprite.flip_h = 0
		if degrees > 2.355 and degrees < 3.925:
			$AnimatedSprite.flip_h = 1
		if degrees > 3.925 and degrees < 5.498:
			$AnimatedSprite.play("walk_up")
		if degrees > 0.785 and degrees < 2.355:
			$AnimatedSprite.play("walk_down")
		
	if degrees < 3.14:
		degrees += 3.14
		print(degrees)
		if degrees > 5.498 or degrees < 0.785:
			$AnimatedSprite.play("walk")
			$AnimatedSprite.flip_h = 0
		if degrees > 2.355 and degrees < 3.925:
			$AnimatedSprite.play("walk")
			$AnimatedSprite.flip_h = 1
		if degrees > 3.925 and degrees < 5.498:
			$AnimatedSprite.play("walk_up")
		if degrees > 0.785 and degrees < 2.355:
			$AnimatedSprite.play("walk_down")

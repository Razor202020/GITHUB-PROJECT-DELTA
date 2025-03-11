extends CharacterBody2D
func _process(_delta):
	var direction = Vector2.RIGHT
	velocity = direction * 50
	move_and_slide()
	#Input.get_vector("Left", "Right", "Up", "Down")a

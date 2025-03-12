extends CharacterBody2D
func _process(_delta):
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * 1
	move_and_slide()
	Input.get_vector("Left", "Right", "Up", "Down")

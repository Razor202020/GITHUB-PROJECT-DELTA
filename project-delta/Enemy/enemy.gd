extends CharacterBody2D
func _process(_delta):
	var direction = Vector2.LEFT
	velocity = direction * 150
	move_and_slide()

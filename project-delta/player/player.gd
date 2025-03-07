extends CharacterBody2D
func _process(delta):
	var direction = Input.get_vector("Left","Right","Up","Down")
	position += direction * 500 * delta

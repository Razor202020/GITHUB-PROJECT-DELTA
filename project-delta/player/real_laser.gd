extends Area2D
var flag = false
var tflag = false
@export var speed: int = 1000
var direction: Vector2 = Vector2.RIGHT
func _process(delta):
	if position.x > get_global_mouse_position().x and flag == false:
		direction = Vector2.LEFT
		print("laser left")
		flag = true
	position += direction * speed * delta 

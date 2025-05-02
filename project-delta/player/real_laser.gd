extends Node2D
var flag = false
var tflag = false
var Enemy_In_Attack_Range = false
@export var speed: int = 1000
var direction: Vector2 = Vector2.RIGHT
func _process(delta):
	#if $Sprite2D.flip_h == true:
		#direction = Vector2.LEFT
		#print("from REAL LASER")
	#if $Sprite2D.flip_h == false:
		#direction = Vector2.RIGHT
	#$Sprite2D.player_direction
	#player_direction
	position += direction * delta * speed * -1 if Globals.player_direction == 'left' else direction * delta * speed * 1


func _on_body_entered(body):
	if body.has_method("Enemy"):
		Enemy_In_Attack_Range = true
		print("oh")

func _on_body_exited(body):
	if body.has_method("Enemy"):
		Enemy_In_Attack_Range = false

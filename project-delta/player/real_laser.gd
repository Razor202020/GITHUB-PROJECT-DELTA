extends Node2D
var flag = false
var tflag = false
var Enemy_In_Attack_Range = false
@export var speed: int = 10000
var direction: Vector2 = Vector2.RIGHT
func _physics_process(delta: float) -> void:
	position += direction * delta * speed * -1 if Globals.player_direction == 'left' else direction * delta * speed * 1
func player():
	pass

func _on_body_entered(body):
	if body.has_method("Enemy"):
		Enemy_In_Attack_Range = true
		print("oh")

func _on_body_exited(body):
	if body.has_method("Enemy"):
		Enemy_In_Attack_Range = false
func enemy_attack():
	print("player")

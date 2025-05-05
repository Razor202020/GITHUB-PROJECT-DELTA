extends Node2D
var flag = false
var tflag = false
@export var speed: int = 10000
var direction: Vector2 = Vector2.RIGHT
func _physics_process(delta: float) -> void:
	position += direction * delta * speed * -1 if Globals.player_direction == 'left' else direction * delta * speed * 1
func laser_deal_damage():
	pass

func _on_visible_on_screen_enabler_2d_screen_exited() -> void:
	queue_free()

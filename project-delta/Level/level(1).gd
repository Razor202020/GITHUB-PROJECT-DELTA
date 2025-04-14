extends Node2D

var movement_flag = false
var flag = false
func _on_area_2d_body_entered(_body: Node) -> void:
	print("first test")
	flag = true 
func _process(_delta: float) -> void:
	get_global_mouse_position()
	if Input.is_action_pressed("interact") and flag == true:
		flag = false
		movement_flag = true
		get_tree().change_scene_to_file("res://Level/secret.tscn")
	if movement_flag == true:
		move_local_x(310)

func _on_player_laser():
	print("laser form level")

extends Node2D


var flag = false
func _on_area_2d_body_entered(_body: Node) -> void:
	print("first test")
	flag = true 
func _process(_delta: float) -> void:
	get_global_mouse_position()
	if Input.is_action_pressed("interact") and flag == true:
		flag = false
		get_tree().change_scene_to_file("res://Level/level(2).tscn")

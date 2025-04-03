extends Node2D


var flag = false
func _on_area_2d_body_entered(body: Node) -> void:
	print("first test")
	flag = true 
func _process(delta: float) -> void:
	if Input.is_action_pressed("interact") and flag == true:
		flag = false
		get_tree().change_scene_to_file("res://Level/level(2).tscn")

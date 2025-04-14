extends Node2D
var flag = false
func _on_area_2d_body_entered(_body: Node) -> void:
	print("second test you are in the rock demention")
	flag = true 
func _process(_delta: float) -> void:
	if Input.is_action_pressed("interact") and flag == true:
		flag = false
		get_tree().change_scene_to_file("res://Level/level(1).tscn")

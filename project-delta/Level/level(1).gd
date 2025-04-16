extends Node2D

var flag = false
func _on_area_2d_body_entered(_body):
	print("first test")
	print(_body)
	flag = true
	
func _process(_delta):

	get_global_mouse_position()
	if Input.is_action_pressed("interact") and flag == true:
		flag = false
		get_tree().change_scene_to_file("res://Level/secret.tscn")


func _on_player_laser():
	print("laser form level")




func _on_area_2d_body_exited(body: Node2D) -> void:
	flag = false

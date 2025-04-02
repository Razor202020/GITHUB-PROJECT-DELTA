extends Node2D


#func _on_area_2d_body_entered(_body):
	#print("first test")
	#if Input.is_action_pressed("interact"): #and _on_area_2d_body_entered():
		#print("level 2")
		#get_tree().change_scene_to_file("res://Level/level(1).gd")


func _on_area_2d_body_entered(body: Node) -> void:
	print("first test")
	if Input.is_action_pressed("interact"): #and _on_area_2d_body_entered():
		print("level 2")
	get_tree().change_scene_to_file("res://Level/level(1).tscn")

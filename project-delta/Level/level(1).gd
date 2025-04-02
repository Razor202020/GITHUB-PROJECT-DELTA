extends Node2D


func _on_area_2d_body_entered(body: Node2D) -> void:
	print("entered thing")
	get_tree().change_scene_to_file("res://Level/level(2).tscn")

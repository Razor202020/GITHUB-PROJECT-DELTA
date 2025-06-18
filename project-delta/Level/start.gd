extends Control


func _on_start_pressed() -> void:
	
	get_tree().change_scene_to_file("res://Level/level(1)(1).tscn")


func _on_button_2_pressed() -> void:
	pass


func _on_credidts_pressed() -> void:
	get_tree().change_scene_to_file("res://Level/credits.tscn")

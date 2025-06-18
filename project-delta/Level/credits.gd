extends Control


func _on_backspace_pressed() -> void:
	get_tree().change_scene_to_file("res://Level/start.tscn")

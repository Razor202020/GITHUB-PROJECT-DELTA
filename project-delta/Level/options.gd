extends Control

func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Level/start.tscn")
func _ready() -> void:
	DialogueManager.show_example_dialogue_balloon(load("res://dialogue/no.dialogue"), "start")

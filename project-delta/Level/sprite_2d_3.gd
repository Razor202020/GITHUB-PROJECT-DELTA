extends Sprite2D
func _ready() -> void:
	DialogueManager.show_example_dialogue_balloon(load("res://dialogue/no.dialogue"), "start")

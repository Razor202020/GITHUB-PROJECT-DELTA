extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func go_title_screen():
	get_tree().change_scene_to_file("res://Level/level(1)(1).tscn")

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	go_title_screen()
	pass # Replace with function body.

extends AnimatedSprite2D
func _ready() -> void:
	$".".play("default")
	$GameStart.start()
	
func _on_game_start_timeout() -> void:
	get_tree().change_scene_to_file("res://Level/start.tscn")

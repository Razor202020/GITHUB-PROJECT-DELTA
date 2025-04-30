extends Node2D
var laser_scene: PackedScene = preload("res://player/real_laser.tscn")
var flag = false
func _on_area_2d_body_entered(_body):
	print("first test")
	flag = true	
func _process(_delta):
	get_global_mouse_position()
	if Input.is_action_pressed("interact") and flag == true:
		flag = false
		get_tree().change_scene_to_file("res://Level/level(1)(3).tscn")
func _on_player_laser(pos):
	print("laser form level")
	var laser = laser_scene.instantiate()
	laser.position = pos
	$projectiles.add_child(laser)
func _on_area_2d_body_exited(body: Node2D) -> void:
	flag = false

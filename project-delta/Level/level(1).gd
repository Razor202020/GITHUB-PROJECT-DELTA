extends Node2D

var laser_scene: PackedScene = preload("res://player/laser.tscn")


var flag = false
func _on_area_2d_body_entered(body: Node) -> void:
	print("first test")
	flag = true 
func _process(delta: float) -> void:
	get_global_mouse_position()
	if Input.is_action_pressed("interact") and flag == true:
		flag = false
		get_tree().change_scene_to_file("res://Level/level(2).tscn")
func _on_player_laser(pos, direction):
	var laser = laser_scene.instantiate() as Area2D
	laser.position = pos
	laser.rotation_degrees = rad_to_deg(direction.angle()) + 90
	laser.direction = direction
	$projectiles.add_child(laser)

extends Node2D

var flag = false
func _on_area_2d_body_entered(_body: Node) -> void:
	print("first test")
	flag = true 
func _process(_delta):
	#if $player.stop == true:
		#print("move tset")
		#print($player.position.x)
		#$player.position.x = 288
	get_global_mouse_position()
	if Input.is_action_pressed("interact") and flag == true:
		flag = false
		get_tree().change_scene_to_file("res://Level/secret.tscn")


func _on_player_laser():
	print("laser form level")
func _ready():
	print("yeah")
	if $player.move == false:
		$player.position.x = 670

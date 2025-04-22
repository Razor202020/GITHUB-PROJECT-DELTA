#2:49:38
extends CharacterBody2D
signal laser(pos)
var can_laser: bool = true
var SPEED = 130
var walk = false
var flag_r = true
var target = false

func _process(_delta):

	var direction = Input.get_vector("Left", "Right", "Up", "Down")
	velocity = direction * SPEED
	move_and_slide()
	if Input.is_action_pressed("Sprint"):
		SPEED = 180
	if Input.is_action_just_released("Sprint"):
		SPEED = 110
	if Input.is_action_pressed("Down"):
		$Sprite2D.play("Walk")
	if Input.is_action_just_released("Down"):
		$Sprite2D.play("IDLE")
	if Input.is_action_pressed("Up"):
		$Sprite2D.play("Walk")
	if Input.is_action_just_released("Up"):
		$Sprite2D.play("IDLE")
	if Input.is_action_pressed("Left") and flag_r == true:
		walk = true
		$Sprite2D.play("walk-left")
	if Input.is_action_just_released("Left"):
		walk = false
		$Sprite2D.play("IDLE")
	if Input.is_action_pressed("Right") and flag_r == true:
		walk = true
		$Sprite2D.play("Walk-forward")
	if Input.is_action_just_released("Right"):
		walk = false
		$Sprite2D.play("IDLE")
	if Input.is_action_pressed("PrimaryAction") and can_laser and walk == true and target == true:
		var laser_markers = $LaserStartPositions.get_children()
		var selected_laser = laser_markers[0]
		flag_r = false
		can_laser = false
		$Sprite2D.play("gun-walk")	
		$Timer.start()
		laser.emit(selected_laser.global_position)
	if Input.is_action_just_released("PrimaryAction"):
		$Sprite2D.play("IDLE")
		flag_r = true
	if Input.is_action_pressed("PrimaryAction") and walk == false and can_laser and target == true:
		var laser_markers = $LaserStartPositions.get_children()
		var selected_laser = laser_markers[0]
		$Sprite2D.play("gun")
		can_laser = false
		$Timer.start()
		laser.emit(selected_laser.global_position)
	if Input.is_action_just_released("PrimaryAction"):
		$Sprite2D.play("IDLE")
	if Input.is_action_just_pressed("Aim"):
		target = true
		$Sprite2D.play("gun")
		print("aiming")
	if Input.is_action_just_released("Aim"):
		$Sprite2D.play("IDLE")
		target = false
func _on_timer_timeout():
	can_laser = true

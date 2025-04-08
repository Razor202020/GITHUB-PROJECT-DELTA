extends CharacterBody2D

const SPEED = 110
var walk = false
var flag_r = true
func _process(_delta) -> void:
	var direction = Input.get_vector("Left", "Right", "Up", "Down")
	velocity = direction * SPEED
	move_and_slide()
	if Input.is_action_pressed("Down"):
		$Sprite2D.play("Walk")
	if Input.is_action_just_released("Down"):
		$Sprite2D.play("IDLE")
	if Input.is_action_pressed("Up"):
		$Sprite2D.play("Walk")
	if Input.is_action_just_released("Up"):
		$Sprite2D.play("IDLE")
	if Input.is_action_pressed("Right") and flag_r == true:
		walk = true
		$Sprite2D.play("Walk-forward")
	if Input.is_action_just_released("Right"):
		walk = false
		$Sprite2D.play("IDLE")
	if Input.is_action_pressed("PrimaryAction"):
		flag_r = false
		$Sprite2D.play("gun-walk")	
	if Input.is_action_just_released("PrimaryAction"):
		flag_r = true
		$Sprite2D.play("IDLE")
	if Input.is_action_pressed("PrimaryAction") and walk == false:
		$Sprite2D.play("gun")	
	if Input.is_action_just_released("PrimaryAction"):
		$Sprite2D.play("IDLE")

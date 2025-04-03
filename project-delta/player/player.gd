extends CharacterBody2D

const SPEED = 100

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

#2:49:38
extends CharacterBody2D
signal laser(pos)
var enemy_inAttack_range = false
var enemy_attack_cooldown = true
var can_laser: bool = true
var SPEED = 130
var flag_r = true
var target = false
var flag_left = false
var health = Globals.player_health
var Player_Alive = true
func _process(float):
	var direction = Input.get_vector("Left", "Right", "Up", "Down")
	velocity = direction * SPEED
	move_and_slide()
	enemy_attack()
	if health <= 0:
		Player_Alive = false #add end screen
		health = 0
		self.queue_free()
	if Input.is_action_pressed("Sprint") and Input.is_action_just_pressed("Right"):
		SPEED = 180
		$Sprite2D.play("Walk but faster")
	if Input.is_action_just_released("Sprint") and Input.is_action_just_released("Right"):
		SPEED = 110
		$Sprite2D.play("IDLE")
	if Input.is_action_pressed("Sprint") and Input.is_action_just_pressed("Left"):
		SPEED = 180
		$Sprite2D.flip_h = true
		$Sprite2D.play("Walk but faster")
	if Input.is_action_just_released("Sprint") and Input.is_action_just_released("Left"):
		SPEED = 110
		$Sprite2D.flip_h = false
		$Sprite2D.play("IDLE")
	if Input.is_action_just_released("Sprint"):
		SPEED = 110
	if Input.is_action_pressed("Down"):
		$Sprite2D.play("Walk")
	if Input.is_action_pressed("Down") and Input.is_action_just_pressed("Right"):
		$Sprite2D.play("Walk-forward")
	if Input.is_action_pressed("Down") and Input.is_action_just_pressed("Left"):
		$Sprite2D.play("walk-left")
	if Input.is_action_just_released("Down"):
		$Sprite2D.play("IDLE")
	if Input.is_action_pressed("Up"):
		$Sprite2D.play("Walk")
	if Input.is_action_pressed("Up") and Input.is_action_just_pressed("Right"):
		$Sprite2D.play("Walk-forward")
	if Input.is_action_pressed("Up") and Input.is_action_just_pressed("Left"):
		$Sprite2D.play("walk-left")
	if Input.is_action_just_released("Up"):
		$Sprite2D.play("IDLE")
	if Input.is_action_pressed("Left"):
		$Sprite2D.play("walk-left")
	if Input.is_action_just_released("Left"):
		$Sprite2D.play("IDLE")
	if Input.is_action_pressed("Right"):
		$Sprite2D.play("Walk-forward")
	if Input.is_action_just_released("Right"):
		$Sprite2D.play("IDLE")
	if Input.is_action_just_released("PrimaryAction"):
		$Sprite2D.play("IDLE")
	if Input.is_action_pressed("PrimaryAction") and can_laser and target == true:
		var laser_markers = $LaserStartPositions.get_children()
		var selected_laser = laser_markers[0]
		$Sprite2D.play("gun")
		can_laser = false
		$Timer.start()
		if $Sprite2D.flip_h == true:
			selected_laser = laser_markers[1]
		laser.emit(selected_laser.global_position)
	if Input.is_action_just_released("PrimaryAction"):
		$Sprite2D.play("IDLE")
	if Input.is_action_just_pressed("Aim") and position.x < get_global_mouse_position().x:
		target = true
		$Sprite2D.play("gun")
		Globals.player_direction = 'right'
		print("right")
	if Input.is_action_just_released("Aim"):
		$Sprite2D.flip_h = false
		$Sprite2D.play("IDLE")
		target = false
	if Input.is_action_just_pressed("Aim") and position.x > get_global_mouse_position().x:
		target = true
		$Sprite2D.flip_h = true
		$Sprite2D.play("gun")
		Globals.player_direction = 'left'
		print("left")
func _on_timer_timeout():
	can_laser = true
func player():
	pass
func enemy_attack():
	if enemy_inAttack_range and enemy_attack_cooldown == true:
		health -= 20
		Globals.player_health = health
		enemy_attack_cooldown = false
		$attack_cooldown.start()
		print(health)
func _on_player_hitbox_area_entered(area):
	if area.has_method("enemy"):
		print("is in enemy")
		enemy_inAttack_range = true
func _on_player_hitbox_area_exited(area):
	if area.has_method("enemy"):
		print("not in enemy")
		enemy_inAttack_range = false
func _on_attack_cooldown_timeout():
	enemy_attack_cooldown = true

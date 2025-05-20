extends CharacterBody2D
#zoom  66
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
#Down movement
	if Input.is_action_pressed("Down"):
		if Input.is_action_pressed("Right"):
			if Input.is_action_pressed("Sprint"):
				SPEED = 180
				$Sprite2D.play("Walk but faster")
			else:
				SPEED = 130
				$Sprite2D.play("Walk-forward")
		elif Input.is_action_pressed("Left"):
			if Input.is_action_pressed("Sprint"):
				SPEED = 180
				$Sprite2D.play("walk but faster left")
			else:
				SPEED = 130
				$Sprite2D.play("walk-left")
		else:
			$Sprite2D.play("Walk")
	if Input.is_action_just_released("Down"):
		await get_tree().create_timer(0.1).timeout
		$Sprite2D.play("IDLE")
#UP MOvemnet
	if Input.is_action_pressed("Up"):
		if Input.is_action_pressed("Right"):
			if Input.is_action_pressed("Sprint"):
				SPEED = 180
				$Sprite2D.play("Walk but faster")
			else:
				SPEED = 130
				$Sprite2D.play("Walk-forward")
		elif Input.is_action_pressed("Left"):
			if Input.is_action_pressed("Sprint"):
				SPEED = 180
				$Sprite2D.play("walk but faster left")
			else:
				SPEED = 130
				$Sprite2D.play("walk-left")
		else:
			$Sprite2D.play("Walk")
	if Input.is_action_just_released("Up"):
		await get_tree().create_timer(0.1).timeout
		$Sprite2D.play("IDLE")	
#Left Movement
	if Input.is_action_pressed("Left"):
		if Input.is_action_pressed("Sprint"):
			SPEED = 180
			$Sprite2D.play("walk but faster left")
		else:
			SPEED = 130
			$Sprite2D.play("walk-left")
	if Input.is_action_just_released("Left"):
		await get_tree().create_timer(0.1).timeout
		$Sprite2D.play("IDLE")		
#Right Movement
	if Input.is_action_pressed("Right"):
		if Input.is_action_pressed("Sprint"):
			SPEED = 180
			$Sprite2D.play("Walk but faster")
		else:
			SPEED = 130
			$Sprite2D.play("Walk-forward")
	if Input.is_action_just_released("Right"):
		await get_tree().create_timer(0.1).timeout
		$Sprite2D.play("IDLE")
#GUN ACTIONS
	#Shooting The Laser
	if Input.is_action_pressed("PrimaryAction") and can_laser and target == true:
		var laser_markers = $LaserStartPositions.get_children()
		var selected_laser = laser_markers[0]
		$Sprite2D.play("gun")
		can_laser = false
		$FireRate.start()
		if position.x > get_global_mouse_position().x:
			selected_laser = laser_markers[1]
		laser.emit(selected_laser.global_position)
	if Input.is_action_just_released("PrimaryAction"):
		await get_tree().create_timer(0.1).timeout
		$Sprite2D.play("IDLE")
	#AimING and walking with the gun
	#GUn facing Right
	if Input.is_action_pressed("Aim") and position.x < get_global_mouse_position().x:
		target = true
		$Sprite2D.play("gun")
		Globals.player_direction = 'right'
	if Input.is_action_just_released("Aim") and position.x < get_global_mouse_position().x:
		await get_tree().create_timer(0.1).timeout
		$Sprite2D.play("IDLE")
		target = false
	# gun facing LEft
	if Input.is_action_pressed("Aim") and position.x > get_global_mouse_position().x:
		target = true
		$Sprite2D.play("gun-left")
		Globals.player_direction = 'left'
	if Input.is_action_just_released("Aim") and position.x > get_global_mouse_position().x:
		await get_tree().create_timer(0.1).timeout
		$Sprite2D.play("IDLE")
		target = false
#Combat System
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
func _on_fire_rate_timeout():
	can_laser = true

extends CharacterBody2D
signal laser(pos, direction)
const SPEED = 100
var can_laser: bool = true
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
	get_global_mouse_position()
	var player_direction = (get_global_mouse_position() - position).normalized()
	if Input.is_action_pressed("PrimaryAction") and can_laser:
		var laser_markers = $LaserStartPositions.get_children()
		var selected_laser = laser_markers[randi() % laser_markers.size()]
		can_laser = false
		laser.emit(selected_laser.global_position, player_direction)

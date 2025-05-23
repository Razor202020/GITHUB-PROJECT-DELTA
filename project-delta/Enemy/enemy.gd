extends CharacterBody2D
var Speed = 100
var health = 100
var dead = false
var player_chase = false
var player = null
@onready var navigation_agent: NavigationAgent2D = $NavigationAgent2D
@export var target_to_chase: CharacterBody2D
func _ready():
	dead = false
	set_physics_process(false)
	call_deferred("wait_for_physics")
func wait_for_physics():
	await  get_tree().physics_frame
	set_physics_process(true)
func _physics_process(_delta):
	if !dead:
		$DetectionArea/CollisionShape2D.disabled = false
		if player_chase:
			#position += (player.position - position)/Speed
			if navigation_agent.is_navigation_finished() and target_to_chase.global_position == navigation_agent.target_position:
				return
			navigation_agent.target_position = target_to_chase.global_position
			velocity = global_position.direction_to(navigation_agent.get_next_path_position()) * Speed
			move_and_slide()
			$AnimatedSprite2D.play("enemyWalk")
			if(player.position.x - position.x) < 0:
				$AnimatedSprite2D.flip_h = false
			else:
				$AnimatedSprite2D.flip_h = true
		else:
			await get_tree().create_timer(0.1).timeout
			$AnimatedSprite2D.play("Idle")
	if dead:
		$DetectionArea/CollisionShape2D.disabled = true
	if health == 0 or health < 0:
		death()
func _on_detection_area_body_entered(body):
	if body.has_method("player"):
		player_chase = true
		player = body
func _on_detection_area_body_exited(body):
	if body.has_method("player"):
		player_chase = false
func _on_enemy_hitbox_area_entered(area):
	var damage
	if area.has_method("laser_deal_damage"):
		damage = 20
		take_damage(damage)
		print(health)
func take_damage(damage):
	health -= damage
	#Globals.Jeff_1_health = health
	if health <= 0 and !dead:
		health = 0
		death()
func death():
	dead = true
	await get_tree().create_timer(0.1).timeout
	queue_free()
func enemy():
	pass

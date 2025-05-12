extends CharacterBody2D
var Speed = 50

var health = 100

var dead = false
var player_chase = false
var player = null

func _ready():
	dead = false

func _physics_process(delta):
	if !dead:
		$DetectionArea/CollisionShape2D.disabled = false
		if player_chase:
			position += (player.position - position)/Speed
			$AnimatedSprite2D.play("enemyWalk")
		else:
			pass
	if dead:
		$DetectionArea/CollisionShape2D.disabled = true
	if health == 0:
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
		damage = 100
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

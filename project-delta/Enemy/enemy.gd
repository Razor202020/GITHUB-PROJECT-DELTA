extends CharacterBody2D
var Speed =20

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
		
func _on_detection_area_body_entered(body):
	if body.has_method("player"):
		player_chase = true
		player = body

func _on_detection_area_body_exited(body):
	if body.has_method("player"):
		player_chase = false


#1403


func _on_enemy_hitbox_area_entered(area):
	var damage
	if area.has_method("laser_deal_damage"):
		damage = 50
		take_damage(damage)
func take_damage(damage):
	health = health - damage
	if health <= 0 and !dead:
		death()
func death():
	dead = true
	await get_tree().create_timer(1).timeout
	queue_free()

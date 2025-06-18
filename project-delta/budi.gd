extends AnimatedSprite2D
var flag = true
func _ready() -> void:
	$".".play("bootup")
	$Timer.start()
func _process(delta: float) -> void:
	
	if Input.is_action_just_pressed("close"):
		queue_free()
func _on_timer_timeout() -> void:
	$".".play("yap")

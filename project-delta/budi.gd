extends AnimatedSprite2D
var flag = true
func _ready() -> void:
	$".".play("bootup")
	
	while true:
		$".".play("yap")
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("close"):
		queue_free()
	
		


func _on_timer_timeout() -> void:
	pass # Replace with function body.

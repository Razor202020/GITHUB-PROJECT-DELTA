extends AnimatedSprite2D
var flag = true
func _ready() -> void:
	$".".play("bootup")
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("close"):
		queue_free()
	
		

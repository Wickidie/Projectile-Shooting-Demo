extends CharacterBody2D

var direction = Vector2()
var speed = 500.0

func _ready():
	$BulletSFX.play()
	pass
	
func _physics_process(delta):
	position += direction * speed * delta
		
	pass
	
func fire(_direction):
	direction = _direction
	#print(direction)

func _on_timer_timeout():
	queue_free()
	pass # Replace with function body.

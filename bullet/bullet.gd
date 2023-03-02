extends RigidBody2D

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

func _on_Timer_timeout():
	queue_free()
	pass # Replace with function body.

func _on_Bullet_body_entered(body):
	print(body)
	pass # Replace with function body.

func _on_Bullet_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	
	print(body)
	pass # Replace with function body.

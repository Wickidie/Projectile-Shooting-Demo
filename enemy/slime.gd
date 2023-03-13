extends CharacterBody2D


func _ready():
	$SlimeAnimSprite.play("default")
	pass
	
func _physics_process(delta):
	# look_at(Global.player_pos)
	$SlimeRay.target_position = Global.player_pos - self.position
	self.set_velocity($SlimeRay.target_position.normalized() * 20)
	self.move_and_slide()
	self.velocity
	
	
	pass

func _on_Area2D_body_entered(body):
	if body.is_in_group("bullet"):
		queue_free()
	else:
		print(body)
	pass # Replace with function body.

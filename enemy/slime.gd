extends Node2D


func _ready():
	
	pass
	
func _physics_process(delta):
	# look_at(Global.player_pos)
	$SlimeKine/SlimeRay.target_position = Global.player_pos - position
	$SlimeKine.set_velocity($SlimeKine/SlimeRay.target_position.normalized() * 20)
	$SlimeKine.move_and_slide()
	$SlimeKine.velocity
	
	
	pass

func _on_Area2D_body_entered(body):
	if body.is_in_group("bullet"):
		queue_free()
	else:
		print(body)
	pass # Replace with function body.

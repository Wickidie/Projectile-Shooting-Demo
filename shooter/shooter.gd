extends Node2D
	
@export var projectile_scene: PackedScene

var Lmouse_pressed
var can_fire = true
var relative_position
var gun_distance = 50

func _ready():
	pass
	
func _physics_process(delta):
	var move_direction := Vector2(
	Input.get_action_strength("move_right") -
	Input.get_action_strength("move_left"),
	Input.get_action_strength("move_down") -
	Input.get_action_strength("move_up"))
	
	if move_direction.length() > 1.0:
		move_direction = move_direction.normalized()
	
	$ShooterKine.set_velocity(100 * move_direction)
	$ShooterKine.move_and_slide()
	$ShooterKine.velocity
	Global.player_pos = $ShooterKine.position + position
	
	relative_position = get_local_mouse_position() - $ShooterKine.position
	$ShooterKine/ShootDirection.target_position = relative_position.normalized() * gun_distance
	$ShooterKine/SpawnOrigin.rotation = (relative_position).angle()
	
	print(move_direction)
	
	pass
	
func _process(delta):
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) and $FireRate.is_stopped(): # Holding Lmouse
		shoot()
		
	pass

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed: # Shooting single click
			shoot()
	pass

func shoot():
	if can_fire:
		$FireRate.start()
		var projectile = projectile_scene.instantiate()
		var direction = (relative_position).angle()
		var distance = Vector2($ShooterKine/ShootDirection.target_position.x, $ShooterKine/ShootDirection.target_position.y)
		# position = point + (position - point).rotated(angle)
		projectile.position = (relative_position.normalized() * 50) + $ShooterKine.position
		projectile.rotation = direction
		add_child(projectile)
		print(get_viewport())
		projectile.fire((get_local_mouse_position() - $ShooterKine.position).normalized())
		can_fire = false
		# print(can_fire)
		print(get_local_mouse_position() - $ShooterKine.position)
	pass

func _on_FireRate_timeout():
	can_fire = true
	$FireRate.stop()
	pass

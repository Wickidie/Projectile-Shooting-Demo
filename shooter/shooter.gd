extends CharacterBody2D
	
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
	
	self.set_velocity(100 * move_direction)
	self.move_and_slide()
	self.velocity
	Global.player_pos = self.position
	
	relative_position = get_local_mouse_position()
	$ShootDirection.target_position = relative_position.normalized() * gun_distance
	$SpawnOrigin.rotation = (relative_position).angle()
	
#	print(move_direction)
	
	pass
	
func _process(delta):
	if (get_local_mouse_position().x < 0):
		$SpawnOrigin/ProjectileSpawn.flip_v = 1
	else:
		$SpawnOrigin/ProjectileSpawn.flip_v = 0
		pass
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) and $FireRate.is_stopped(): # Holding Lmouse
		shoot()
		
	pass

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed: # Shooting single click
			shoot()
	pass

func shoot():
	print(can_fire)
	if can_fire:
		$FireRate.start()
		var projectile = projectile_scene.instantiate()
		var direction = (relative_position).angle()
		var distance = Vector2($ShootDirection.target_position.x, $ShootDirection.target_position.y)
		# position = point + (position - point).rotated(angle)
		projectile.position = (relative_position.normalized() * 150) + self.position
		projectile.rotation = direction
		Global.arena_node.add_child(projectile)
#		print(get_viewport())
		projectile.fire((get_local_mouse_position()).normalized())
		can_fire = false
#		print(can_fire)
		print(get_local_mouse_position())
	pass

func _on_FireRate_timeout():
	can_fire = true
	$FireRate.stop()
	pass

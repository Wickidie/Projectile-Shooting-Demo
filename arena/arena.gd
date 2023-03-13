extends NinePatchRect

@export var enemy_scene: PackedScene

func _ready():
	randomize()
	Global.arena_node = self
	for i in 10:
		var slime = enemy_scene.instantiate()
		add_child(slime)
		slime.position = Vector2(randf_range(0, 1024), randf_range(0, 600))
		
	pass

func _process(delta):
	$DebugText.text = str(Global.player_pos)
	pass
	
func _physics_process(delta):
	$RayCast2D.target_position = Global.player_pos
	pass


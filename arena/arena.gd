extends Control

export(PackedScene) var enemy_scene

func _ready():
	randomize()
	for i in 10:
		var slime = enemy_scene.instance()
		add_child(slime)
		slime.position = Vector2(rand_range(0, 1024), rand_range(0, 600))
		
	pass

func _process(delta):
	$DebugText.bbcode_text = str(Global.player_pos)
	pass
	
func _physics_process(delta):
	$RayCast2D.cast_to = Global.player_pos
	pass


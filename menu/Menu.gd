extends NinePatchRect

@export var arena_scene: PackedScene
signal button_pressed

func _ready():
	Global.arena_scene = arena_scene
	pass

func _on_play_button_pressed():
	get_tree().change_scene_to_packed(arena_scene)
	print($ButtonContainer/PlayButton)
	pass # Replace with function body.

func _on_option_button_pressed():
	print($ButtonContainer/OptionButton)	
	pass # Replace with function body.

func _on_exit_button_pressed():
	get_tree().quit()
	print($ButtonContainer/ExitButton)	
	pass # Replace with function body.

func _on_play_button_mouse_entered():
	$ButtonContainer/PlayButton.modulate = Color(0.8, 0.8, 0.8)
	pass # Replace with function body.


func _on_option_button_mouse_entered():
	$ButtonContainer/OptionButton.modulate = Color(0.8, 0.8, 0.8)
	pass # Replace with function body.


func _on_exit_button_mouse_entered():
	$ButtonContainer/ExitButton.modulate = Color(0.8, 0.8, 0.8)
	pass # Replace with function body.

func _on_play_button_mouse_exited():
	$ButtonContainer/PlayButton.modulate = Color(1.0, 1.0, 1.0)
	pass # Replace with function body.


func _on_option_button_mouse_exited():
	$ButtonContainer/OptionButton.modulate = Color(1.0, 1.0, 1.0)
	pass # Replace with function body.


func _on_exit_button_mouse_exited():
	$ButtonContainer/ExitButton.modulate = Color(1.0, 1.0, 1.0)
	pass # Replace with function body.

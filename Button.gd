extends Button


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if not Global.game_in_progress:
		show()


func _on_pressed():
	get_tree().reload_current_scene()
	Global.circle= true
	Global.game_in_progress= true

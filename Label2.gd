extends Label


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if not Global.game_in_progress:
		text= "Circle has won the game" if Global.circle else "Cross has won the game"
		show()

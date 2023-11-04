extends Button

var empty: bool= true
var state: int= 0


func _on_pressed():
	if empty and Global.game_in_progress:
		if Global.circle:
			icon= preload("res://circle.png")
			state= 1
		else:
			icon= preload("res://cross.png")
			state= 2
		if get_parent().check_win():
			get_parent().win()
		else:
			Global.circle= not Global.circle
			empty= false

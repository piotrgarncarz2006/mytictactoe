extends GridContainer


func win():
	Global.game_in_progress= false

func get_col_from_array(arr: Array, col: int) -> Array[int]:
	var ret: Array[int]
	for y in arr:
		ret.push_back(y[col])
	return ret

func get_diagonal_from_array(arr: Array, l2r: bool) -> Array[int]:
	var ret: Array[int]
	var i= 0
	
	if l2r:
		while(i< arr.size()):
			ret.push_back(arr[i][i])
			i+= 1
	else:
		var x= arr.size()- 1
		var y= 0
		while(x>= 0):
			ret.push_back(arr[y][x])
			x-= 1
			y+= 1
	
	return ret

func check_win() -> bool:
	var state= [
		[0, 0, 0],
		[0, 0, 0],
		[0, 0, 0],
		]
	var x= 0
	var y= 0
	
	for c in get_children():
		state[y][x]= c.state
		x+= 1
		if x== 3:
			x= 0
			y+= 1
	
	var expected= 1 if Global.circle else 2
	var ret: bool= false
	var expected_arr= [expected, expected, expected]
	
	if state[0]== expected_arr:
		ret= true
	if state[1]== expected_arr:
		ret= true
	if state[2]== expected_arr:
		ret= true
	
	if get_col_from_array(state, 0)== expected_arr:
		ret= true
	if get_col_from_array(state, 1)== expected_arr:
		ret= true
	if get_col_from_array(state, 2)== expected_arr:
		ret= true
	
	if get_diagonal_from_array(state, true)== expected_arr:
		ret= true
	if get_diagonal_from_array(state, false)== expected_arr:
		ret= true
	
	return ret

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

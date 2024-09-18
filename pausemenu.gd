extends Node2D


var paused = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("pause"):
		pauseMenu()
		
func pauseMenu():
	if paused:
		pausemenu.hide()
		Engine.time_scale = 1
	else:	
		pausemenu.show()
		Engine.time_scale = 0
		
	paused = !paused

extends Control

@onready var pause_menu = $PauseMenu
var pause = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("pause"):
		pauseMenu()
		
func pauseMenu():
	if pause:
		pause_menu.hide()
		Engine.time_scale = 1
	else:	
		pause_menu.show()
		Engine.time_scale = 0
		
	pause = !pause

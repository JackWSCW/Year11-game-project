extends RigidBody2D

@export var fall_key: String = "Space"  # Key to trigger the fall
var player_in_range = false  # Track if the player is within the range

func _ready():
	# Connect Area2D signals to detect player entering/exiting range
	$Area2D.connect("body_entered", self, "_on_area_entered")
	$Area2D.connect("body_exited", self, "_on_area_exited")

	# Disable physics until the object is triggered to fall
	self.mode = RigidBody2D.MODE_STATIC

# Called when the player enters the Area2D
func _on_area_entered(body: Node):
	if body.name == "Player":  # Adjust this to your player's node name
		player_in_range = true

# Called when the player exits the Area2D
func _on_area_exited(body: Node):
	if body.name == "Player":
		player_in_range = false

# Check for key press when the player is in range
func _process(delta):
	if player_in_range and Input.is_action_just_pressed(fall_key):
		self.mode = RigidBody2D.MODE_RIGID  # Make the object fall

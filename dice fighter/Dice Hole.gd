extends TextureRect

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func can_drop_data(position, data):
	#check if the dice is acceptable
	return true

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
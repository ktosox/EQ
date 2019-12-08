extends TextureRect

var dice_preview_scene = load("res://dice fighter/Drag Preview.tscn")
# Declare member variables here. Examples:

#faces are:
# 1 - 
export var face : int
export var color : int



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func get_drag_data(position):
	#check if this can be draged
	#if not - return
	var preview = dice_preview_scene.instance()
	preview.texture = texture
	preview.modulate = modulate
	set_drag_preview(preview)
	#return dice face data
	pass
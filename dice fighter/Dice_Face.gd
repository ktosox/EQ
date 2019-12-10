extends TextureRect

var dice_preview_scene = load("res://dice fighter/Drag_Preview.tscn")
# Declare member variables here. Examples:

#faces can be from 1 to 3
export(int, 0 , 3) var face 
#colors 1- RED / 2 - YELLOW
#					3 - GREEN / 4-BLUE
#	 0 - for GRAY

export(int, 0 , 4) var color



# Called when the node enters the scene tree for the first time.
func _ready():
	update_face()
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func update_face():
	match (face):
		0 :
			texture = null
		1 :
			texture = load("res://Resources/potions/t_31.png")
		2:
			texture = load("res://Resources/potions/t_38.png")
		3:
			texture = load("res://Resources/potions/t_98.png")
	match (color):
		0:
			$Dice_Color.modulate = Color(0.3,0.3,0.3)
		1:
			$Dice_Color.modulate = Color(1,0,0)
		2:
			$Dice_Color.modulate = Color(1,1,0)
		3:
			$Dice_Color.modulate = Color(0,1,0)
		4:
			$Dice_Color.modulate = Color(0,0,1)

func get_drag_data(position):
	#check if this can be draged
	#if not - return
	var preview = dice_preview_scene.instance()
	preview.set_face(texture)
	preview.set_color($Dice_Color.modulate)
	set_drag_preview(preview)
	var face_data = [face, color]
	return face_data
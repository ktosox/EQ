extends ColorRect

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	test_roll_dice()
	pass # Replace with function body.
	
func test_roll_dice():
	$VBoxContainer/Dice_Face.face = randi()%3 + 1
	$VBoxContainer/Dice_Face.color = randi()%5
	$VBoxContainer/Dice_Face.update_face()
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

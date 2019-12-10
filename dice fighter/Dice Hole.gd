extends TextureRect

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export(int, 0 , 3) var held_face

export(int, 0 , 4) var held_color

export(int, 0 , 3) var needed_face

export(int, 0 , 4) var needed_color

var is_locked = false


# Called when the node enters the scene tree for the first time.
func _ready():
	
	test_random_needed()
	pass # Replace with function body.

func test_random_needed():
	randomize()
	needed_face = randi()%3 + 1
	needed_color = randi()%5
	update_needed()
	pass

func can_drop_data(position, data):
	#check if the dice is acceptable
	if(needed_color == 0 or data[1] == needed_color):
		if(needed_face == 0 or data[0] == needed_face):
			return true
	return false
#	if(data[0]==needed_face and data[1]==needed_color):
#	#this needs to consider whether no face or no sing are a thing
#		return true
#	else:
#		return false

func drop_data(position, data):
	held_face = data[0]
	held_color = data[1]
	update_held()
	$Held_Dice.visible=true
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func update_held():
	match (held_face):
		0 :
			$Held_Dice/Sign.texture = null
		1 :
			$Held_Dice/Sign.texture = load("res://Resources/potions/t_31.png")
		2:
			$Held_Dice/Sign.texture = load("res://Resources/potions/t_38.png")
		3:
			$Held_Dice/Sign.texture = load("res://Resources/potions/t_98.png")
	match (held_color):
		0:
			$Held_Dice/Color.modulate = Color(0.3,0.3,0.3)
		1:
			$Held_Dice/Color.modulate = Color(1,0,0)
		2:
			$Held_Dice/Color.modulate = Color(1,1,0)
		3:
			$Held_Dice/Color.modulate = Color(0,1,0)
		4:
			$Held_Dice/Color.modulate = Color(0,0,1)
	
func update_needed():
	match (needed_face):
		0 :
			$Sign_indicator/Sign.texture = null
		1 :
			$Sign_indicator/Sign.texture = load("res://Resources/potions/t_31.png")
		2:
			$Sign_indicator/Sign.texture = load("res://Resources/potions/t_38.png")
		3:
			$Sign_indicator/Sign.texture = load("res://Resources/potions/t_98.png")
	match (needed_color):
		0:
			$Color_inidcator.modulate = Color(0.3,0.3,0.3)
		1:
			$Color_inidcator.modulate = Color(1,0,0)
		2:
			$Color_inidcator.modulate = Color(1,1,0)
		3:
			$Color_inidcator.modulate = Color(0,1,0)
		4:
			$Color_inidcator.modulate = Color(0,0,1)
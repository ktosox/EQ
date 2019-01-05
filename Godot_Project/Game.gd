extends Node

# class member variables go here, for example:
# var a = 2
# var b = "textvar
const numberOfSlotsX = 60
const numberOfSlotsY = 60
var ArrayOfSlots = []

func _ready():
	FillItemSlotGrid()
	pass

func FillItemSlotGrid():
	var width = 0
	var height = 0
	for height in range(numberOfSlotsY):
		
		for width in range(numberOfSlotsX):
			
			MakeNewITemSlot(width, height)
			#print("new item at", width, " : ", height)
	#repet for countY
	#repeat for countX
	#make new item at countX - countY
	
	pass

func MakeNewITemSlot(countX, countY):
	print("MakeNewITemSlot got X and Y: ",countX, " ", countY)
	var ItemSlotBase = load("res://ItemSlot.tscn")
	var NewSlot = ItemSlotBase.instance()
	NewSlot.rect_global_position = Vector2(countX*20,countY*20)
	#.rect_global_position. = 60#countX*20
	#NewSlot.rect_position.y = countY*20
	$ItemSlotLayer.add_child(NewSlot)

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

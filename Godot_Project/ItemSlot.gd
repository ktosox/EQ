extends ColorRect

var Inventory
var ItemData = {"ID" : 0, "ItemType" : Color()}
var red 
var blue
var green

func _ready():
	randomize()
	red=randf()
	#print(red)
	blue=randf()
	#print(blue)
	green=randf()
	#print(green)
	ItemData["ItemType"] = Color(red,blue,green)
	color=ItemData["ItemType"]
	#print ("new ItemSlot created at ", self.rect_position.x," " , self.rect_position.y)
	print ("My Tag is: ", ItemData["ID"])
	pass

func get_drag_data(position):
	#print("drag started")
	var moving = ColorRect.new()
	moving.rect_size = Vector2(rect_size.x,rect_size.y)
	moving.color=color
	set_drag_preview(moving)
	return ItemData

func can_drop_data(position, data):
	
	return true

func drop_data(position, newItem):
	#print("Item: ",ItemData["ID"], " got drop data from ", newItem["ID"])
	var oldColor = self.color
	var newColor = newItem["ItemType"]
	Inventory.ListOfItemSlots[newItem["ID"]].UpdateColor(oldColor)
	UpdateColor(newColor)
	pass

func UpdateColor(newColor):
	ItemData["ItemType"] = newColor
	color = newColor
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

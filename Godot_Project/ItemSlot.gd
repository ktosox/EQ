extends ColorRect

var Inventory #this holds the owner of this node
var ItemData = {"ID" : 0, "ItemType" : Color()}
var red 
var blue
var green

func _ready():
	randomize()
	red=randf()
	blue=randf()
	green=randf()
	ItemData["ItemType"] = Color(red,blue,green)
	color=ItemData["ItemType"]
	#print ("new ItemSlot created at ", self.rect_position.x," " , self.rect_position.y)
	#print ("My Tag is: ", ItemData["ID"])

func get_drag_data(position):
	#print("drag started")
	var moving = ColorRect.new()
	moving.rect_size = Vector2(rect_size.x,rect_size.y)
	moving.color=color
	set_drag_preview(moving)
	return ItemData

func can_drop_data(position, data):
	#somekind of valid check should be here
	return true

func drop_data(position, newItem):
	var oldColor = self.color
	var newColor = newItem["ItemType"]
	Inventory.ListOfItemSlots[newItem["ID"]].updateColor(oldColor)
	#this should be replaced with a call to Inventory informing of the swap event
	#at Inventory side validity calculation should be actioned and updateColor / othe updates sent as needed
	updateColor(newColor)

func updateColor(newColor):
	ItemData["ItemType"] = newColor
	color = newColor
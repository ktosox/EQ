extends ColorRect

var Inventory #this holds the owner of this node
var ItemLocationID #a unique number defined by ItemManager
var ItemData = {"ID" : 0, "ItemType" : Color()}

func _ready():
	randomize()
	ItemData["ItemType"] = Color(randf(),randf(),randf())
	color=ItemData["ItemType"]
	#print ("new ItemSlot created at ", self.rect_position.x," " , self.rect_position.y)
	#print ("My Tag is: ", ItemData["ID"])

func get_drag_data(position):
	#print("drag started")
	var moving = ColorRect.new()
	moving.rect_size = Vector2(rect_size.x,rect_size.y)
	moving.color=color
	set_drag_preview(moving)
	$AudioGrab.play()
	return ItemData

func can_drop_data(position, data):
	#somekind of valid check should be here
	return true

func drop_data(position, newItem):
	Inventory.swapSlots(ItemData["ID"],newItem["ID"])
	$AudioDrop.play()

func updateColor(newColor):
	ItemData["ItemType"] = newColor
	color = newColor

func changeItem(newItem):
	#update the ItemData held by this ItemSlot
	pass
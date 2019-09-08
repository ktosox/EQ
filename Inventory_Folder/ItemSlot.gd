extends ColorRect

var parentInventory #this holds the owner of this node
var slotLocationID #a unique number defined by ItemManager
var ItemData = {"ID" : 0, "ItemType" : "null", "ItemName" : "null", "texture" : Color()}
var SlotData = {"HoldsItem" : false, "IsLocked" : false, "Texture" : null}



func _ready():
	
	pass

func _gui_input(event):
	
	if(event.is_class("InputEventMouseButton")):
		if(!SlotData["IsLocked"]):
			parentInventory.processEvent(event, self)
			#accept_event()
	pass

#func get_drag_data(position):
#	parentInventory.processPick(self, ItemData)
#	var moving = ColorRect.new()
#	moving.rect_size = Vector2(rect_size.x,rect_size.y)
#	moving.color=self.color
#	set_drag_preview(moving)
#	return ItemData

func can_drop_data(position, data):
	#validity check should be sent to inventory
	#
	if(SlotData["IsLocked"]):
		return false
	else:
		return true


func updateItemTexture():
	self.color = ItemData["color"]
	#request texture from inventory
	#$HeldItemTexture.texture =
	pass
	

func getTexture():
	return $ItemTexture.texture

func setTexture(newTexture):
	$ItemTexture.texture = newTexture
	pass


func freeItem():
	#remove all item data
	ItemData["ID"] = 0
	ItemData["ItemType"] = "null"
	ItemData["ItemName"] = "null"
	#make empty
	pass

func changeItem(newItemData):
	print("item changed")
	ItemData = newItemData
	updateItemTexture()
	#update the ItemData held by this ItemSlot
	#reload HeldITemTexture
	pass

func lockSlot(type = 0):
	#locks down the given item slot
	#defualts to 0 which is gray out
	#gray out would be $Overlay.color = Color(0.8,0.8,0.8,0.4) or something
	#other types of locks can be implemented later
	SlotData["IsLocked"] = true
	pass

func unlockSlot():
	# $Overlay.a = 0 i guess?
	SlotData["IsLocked"] = false
	pass
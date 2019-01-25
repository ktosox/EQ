extends ColorRect

var parentInventory #this holds the owner of this node
var slotLocationID #a unique number defined by ItemManager
var ItemData = {"ID" : 0, "ItemType" : "null", "ItemName" : "null"}
var SlotData = {"HoldsItem" : false, "IsLocked" : false}

func _ready():
	#call function 
	pass

func _gui_input(event):
	if(event.is_pressed()):
		if(!SlotData["IsLocked"]):
			get_drag_data(self.get_global_mouse_position())
	pass

func get_drag_data(position):
	#
	#print("drag started")
	var moving = ColorRect.new()
	moving.rect_size = Vector2(rect_size.x,rect_size.y)
	moving.color=self.color
	set_drag_preview(moving)
	return ItemData

func can_drop_data(position, data):
	#validity check should be sent to inventory
	#
	return true

func drop_data(position, newItem):
	#parentInventory.swapSlots(ItemData["ID"],newItem["ID"])
	#$AudioDrop.play()#sholud be on magaer level
	pass

func updateItemTexture():
	#request texture from inventory
	#$HeldItemTexture.texture =
	pass
	
func freeItem():
	#remove all item data
	ItemData["ID"] = 0
	ItemData["ItemType"] = "null"
	ItemData["ItemName"] = "null"
	#make empty
	pass

func changeItem(newItemData):
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
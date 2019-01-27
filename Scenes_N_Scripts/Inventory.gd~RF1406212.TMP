extends ColorRect

var parentManager #this holds the manager controling this inventory



#DEFINE NUMBER OF ITEM SLOTS
#const numberOfSlotsX = 5
#const numberOfSlotsY = 5

#DEFINE SIZE/SHAPE OF ITEM SLOTS
#const sizeOfItemSlotX = 35
#const sizeOfItemSlotY = 35

#DEFINE HOW BIG THE BOARDER SHOULD BE
#const sizeOfInventoryBoarderX = 15
#const sizeOfInventoryBoarderY = 15

#DEFINE SPACE BETWEEN SLOTS
#const sizeOfItemSlotGapX = 0
#const sizeOfItemSlotGapY = 0

#preload item class
var ItemSlotBase = load("res://Scenes_N_Scripts/ItemSlot.tscn")

#dictionary pairs ItemSlot IDs with specific ItemSlot Nodes
var ListOfItemSlots = {}


func _ready():
		#rescale this so it can hold all of the slots
	#var InventorySizeX = numberOfSlotsX * sizeOfItemSlotX + 2 * sizeOfInventoryBoarderX + (numberOfSlotsX-1) * sizeOfItemSlotGapX
	#var InventorySizeY = numberOfSlotsY * sizeOfItemSlotY + 2 * sizeOfInventoryBoarderY + (numberOfSlotsY-1) * sizeOfItemSlotGapY
	self.rect_size = Vector2(InventorySizeX,InventorySizeY)
		#move the inner slot container so its centerd in the Inventory
	#$ItemSlotLayer.rect_global_position.x = self.rect_global_position.x + sizeOfInventoryBoarderX
	#$ItemSlotLayer.rect_global_position.y = self.rect_global_position.y + sizeOfInventoryBoarderY
	#fillItemSlotGrid() #place all of the itemslots

func fillItemSlotGrid():
	var width = 0
	var height = 0
	for height in range(numberOfSlotsY):
		for width in range(numberOfSlotsX):
			makeNewItemSlot(width, height)

func makeNewItemSlot(countX, countY):
	var NewSlot = ItemSlotBase.instance()
	NewSlot.parentInventory = self #set this as the controler of NewSlot
	NewSlot.slotLocation = parentManager.assignSlotLocation()
	ListOfItemSlots[NewSlot.slotLocationID] = NewSlot #pair ID and NewSlot
	#resize and place NewSlot
	NewSlot.rect_size = Vector2(sizeOfItemSlotX,sizeOfItemSlotY)
	NewSlot.rect_global_position = Vector2(countX*sizeOfItemSlotX + countX*sizeOfItemSlotGapX, countY*sizeOfItemSlotY + countY*sizeOfItemSlotGapY)
	$ItemSlotLayer.add_child(NewSlot) #add NewSlot to the layer that hold ItemSlots
	
	
func _gui_input(event):
	if(event.is_class("InputEventMouseButton")):
		if(event.button_index == 2):
			set_drag_preview(Control.new())
	
	#if(event == InputEventMouseButton):
	
	
	
func swapSlots(firstSlotID, secondSlotID):
	#update internal logic here
	var firstColor = ListOfItemSlots[firstSlotID].ItemData["ItemType"]
	var secondColor = ListOfItemSlots[secondSlotID].ItemData["ItemType"]
	ListOfItemSlots[secondSlotID].updateColor(firstColor)
	ListOfItemSlots[firstSlotID].updateColor(secondColor)
	
	
func lockInventory(type = 0):
	#locks down entire inventory
	#all drag and pick up events are ignored util unlocked
	pass


func unlockInventory():
	#removes lock from inventory
	pass
	

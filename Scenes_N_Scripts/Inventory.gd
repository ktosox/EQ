extends ColorRect

var parentManager #this holds the manager controling this inventory

var inventoryIsLocked = false

var currentItem = null
var currentSlot = null

#preload item class
var ItemSlotBase = load("res://Scenes_N_Scripts/ItemSlot.tscn")

#dictionary pairs ItemSlot IDs with specific ItemSlot Nodes
var ListOfItemSlots = {}


func _ready():
	$ItemSlotLayer/ItemSlot.parentInventory = self
	$ItemSlotLayer/ItemSlot2.parentInventory = self
	$ItemSlotLayer/ItemSlot3.parentInventory = self
	$ItemSlotLayer/ItemSlot4.parentInventory = self
		#rescale this so it can hold all of the slots
	#var InventorySizeX = numberOfSlotsX * sizeOfItemSlotX + 2 * sizeOfInventoryBoarderX + (numberOfSlotsX-1) * sizeOfItemSlotGapX
	#var InventorySizeY = numberOfSlotsY * sizeOfItemSlotY + 2 * sizeOfInventoryBoarderY + (numberOfSlotsY-1) * sizeOfItemSlotGapY
	#self.rect_size = Vector2(InventorySizeX,InventorySizeY)
		#move the inner slot container so its centerd in the Inventory
	#$ItemSlotLayer.rect_global_position.x = self.rect_global_position.x + sizeOfInventoryBoarderX
	#$ItemSlotLayer.rect_global_position.y = self.rect_global_position.y + sizeOfInventoryBoarderY
	#fillItemSlotGrid() #place all of the itemslots
	pass

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
			processEvent(event, null)
	
	#if(event == InputEventMouseButton):
	
	
	

#func processDrop(ItemSlot):
#	if(ItemSlot == currentSlot):
#		ItemSlot.cancelDrag()
#	else:
#		currentSlot.cancelDrag()
#		ItemSlot.changeItem(currentItem)
#		currentSlot = null
#		currentItem = null
#	pass

func processEvent(event, source):
	#called by slot or inventory when an event happens
	#skipped if lock?
	if(inventoryIsLocked):
		return
	#source detemrines where the event comes from,
	#it's either ItemSLot or Inventory
	
	if(source == null): #this means the inventory is making the call, not an ItemSlot
		if(event.button_index == 2 && event.is_pressed()):
			if(currentItem==null):
				return
			print("grab cancelled")
			currentItem = null
			currentSlot = null
			set_drag_preview(Control.new())
	else:
	#extracts meaning out of event -> click? which button?
	#calls the crrect functions to process whats going on
	#event.button_index == 1 is left mouse button
	#event.button_index == 2 is right mouse button
		if(event.button_index == 1 && !event.is_pressed()):
			print("left button up on slot: ", source)
		if(event.button_index == 2 && !event.is_pressed()):
			print("right button up on slot: ", source)
		if(event.button_index == 2 && event.is_pressed()):
			print("right button down on slot: ", source)
		if(event.button_index == 1 && event.is_pressed()):
			print("left button down on slot: ", source)
			if(currentItem == null):
				var moving = TextureRect.new()
				moving.rect_size = Vector2(source.rect_size.x,source.rect_size.y)
				moving.texture  = source.ItemTexture.texture
				set_drag_preview(moving)
				currentItem = source.color
				currentSlot = source
			else:
				currentSlot.color = source.color
				source.color = currentItem
				currentItem = null
				currentSlot = null
				set_drag_preview(Control.new())
		pass

				# INVENTORY LOCKING / UNLOCKING #

func lockInventory(type = 0):
	inventoryIsLocked = true
	$Overlay.visible =true
	#locks down entire inventory
	#all drag and pick up events are ignored util unlocked
	pass

func unlockInventory():
	inventoryIsLocked = false
	$Overlay.visible = false
	#removes lock from inventory
	pass

				# DEBUGGING STUFF #


func _on_Button_pressed(): #debug button
	if(inventoryIsLocked):
		unlockInventory()
	else:
		lockInventory(0)
	pass

# no longer used

#DEFINE NUMBER OF ITEM SLOTS
const numberOfSlotsX = 5
const numberOfSlotsY = 5

#DEFINE SIZE/SHAPE OF ITEM SLOTS
const sizeOfItemSlotX = 35
const sizeOfItemSlotY = 35

#DEFINE HOW BIG THE BOARDER SHOULD BE
const sizeOfInventoryBoarderX = 15
const sizeOfInventoryBoarderY = 15

#DEFINE SPACE BETWEEN SLOTS
const sizeOfItemSlotGapX = 0
const sizeOfItemSlotGapY = 0
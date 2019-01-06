extends ColorRect


#DEFINE NUMBER OF ITEM SLOTS
const numberOfSlotsX = 4
const numberOfSlotsY = 4

#DEFINE SIZE/SHAPE OF ITEM SLOTS
const sizeOfItemSlotX = 60
const sizeOfItemSlotY = 60

#DEFINE HOW BIG THE BOARDER SHOULD BE
const sizeOfInventoryBoarderX = 8
const sizeOfInventoryBoarderY = 8

#DEFINE SPACE BETWEEN SLOTS
const sizeOfItemSlotGapX = 0
const sizeOfItemSlotGapY = 0

#preload item class
var ItemSlotBase = load("res://ItemSlot.tscn")

#dictionary pairs ItemSlot IDs with specific ItemSlot Nodes
var ListOfItemSlots = {}

#variable for tracking given out IDs
var CurrentItemSlotID = 100

func _ready():
	#rescale this so it can hold all of the slots
	var InventorySizeX = numberOfSlotsX * sizeOfItemSlotX + 2 * sizeOfInventoryBoarderX + (numberOfSlotsX-1) * sizeOfItemSlotGapX
	var InventorySizeY = numberOfSlotsY * sizeOfItemSlotY + 2 * sizeOfInventoryBoarderY + (numberOfSlotsY-1) * sizeOfItemSlotGapY
	self.rect_size = Vector2(InventorySizeX,InventorySizeY)
	#move the inner slot container so its centerd in the Inventory
	$ItemSlotLayer.rect_global_position.x = self.rect_global_position.x + sizeOfInventoryBoarderX
	$ItemSlotLayer.rect_global_position.y = self.rect_global_position.y + sizeOfInventoryBoarderY
	fillItemSlotGrid() #place all of the itemslots

func fillItemSlotGrid():
	var width = 0
	var height = 0
	for height in range(numberOfSlotsY):
		for width in range(numberOfSlotsX):
			makeNewItemSlot(width, height)

func makeNewItemSlot(countX, countY):
	var NewSlot = ItemSlotBase.instance()
	NewSlot.Inventory = self #set this as the controler of NewSlot
	NewSlot.ItemData["ID"] = CurrentItemSlotID #set NewSlot ID
	ListOfItemSlots[CurrentItemSlotID] = NewSlot #pair ID and NewSlot
	CurrentItemSlotID+=1 #update ID tracker
	#resize and place NewSlot
	NewSlot.rect_size = Vector2(sizeOfItemSlotX,sizeOfItemSlotY)
	NewSlot.rect_global_position = Vector2(countX*sizeOfItemSlotX + countX*sizeOfItemSlotGapX, countY*sizeOfItemSlotY + countY*sizeOfItemSlotGapY)
	$ItemSlotLayer.add_child(NewSlot) #add NewSlot to the layer that hold ItemSlots
	
func moveItemAction():
	#this should be called by Item slot on drop
	#any item slot movemnt math hapens here
	#next updateColor calls are sent to the droper and dropee
	pass

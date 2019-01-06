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

#PRELOAD ITEMSLOT CLASS
var ItemSlotBase = load("res://ItemSlot.tscn")
var ListOfItemSlots = {"test" : 0}
var CurrentItemSlotID = 100

func _ready():
	ListOfItemSlots.clear()
	#rescale this so it can hold all of the slots
	var InventorySizeX = numberOfSlotsX * sizeOfItemSlotX + 2 * sizeOfInventoryBoarderX + (numberOfSlotsX-1) * sizeOfItemSlotGapX
	var InventorySizeY = numberOfSlotsY * sizeOfItemSlotY + 2 * sizeOfInventoryBoarderY + (numberOfSlotsY-1) * sizeOfItemSlotGapY
	self.rect_size = Vector2(InventorySizeX,InventorySizeY)
	#move ItemSlotLayer so its centerd
	$ItemSlotLayer.rect_global_position.x = self.rect_global_position.x + sizeOfInventoryBoarderX
	$ItemSlotLayer.rect_global_position.y = self.rect_global_position.y + sizeOfInventoryBoarderY
	#place all of the itemslots
	FillItemSlotGrid()
	pass

func FillItemSlotGrid():
	var width = 0
	var height = 0
	for height in range(numberOfSlotsY):
		for width in range(numberOfSlotsX):
			MakeNewITemSlot(width, height)
			#print("new item at", width, " : ", height)
	pass

func MakeNewITemSlot(countX, countY):
	#print("MakeNewITemSlot got X and Y: ",countX, " ", countY)
	var NewSlot = ItemSlotBase.instance()
	NewSlot.Inventory = self
	NewSlot.ItemData["ID"] = CurrentItemSlotID
	ListOfItemSlots[CurrentItemSlotID] = NewSlot
	CurrentItemSlotID+=1
	NewSlot.rect_size = Vector2(sizeOfItemSlotX,sizeOfItemSlotY)
	NewSlot.rect_global_position = Vector2(countX*sizeOfItemSlotX + countX*sizeOfItemSlotGapX, countY*sizeOfItemSlotY + countY*sizeOfItemSlotGapY)
	$ItemSlotLayer.add_child(NewSlot)

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

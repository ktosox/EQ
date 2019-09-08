extends ReferenceRect


var itemSlotIDTracker = 0 #used for setting IDs for item slots


#internal database copy goes here


#list of all controlled inventories goes here
var ownedInventories = []

func _ready():

	
	#future implementation
	#for a 0 to get_child_count()-1 / ownedInventories.append(get_child(a))
	
	ownedInventories.append(get_child(0))
	ownedInventories[0].parentManager = self
	pass

#func _process(delta):
#	pass

#admin stuff at creating a new entry in the item database
#returns a uniq Item ID
func createItemData():
	pass

#archiveing chages to items goes here WIP


#fragmenation check goes here WIP



#intercafe for inventory goes here

func addItem(ItemData):
	#pass item data to inventory
	#check for sucess
	pass

func removeItem():
	pass

func assignSlotLocation():
	itemSlotIDTracker += 1
	return itemSlotIDTracker

#interface for item database goes here WIP
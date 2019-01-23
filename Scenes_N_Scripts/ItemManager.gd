extends ReferenceRect

#internal database copy goes here


#list of all controlled inventories goes here
var ownedInventories = []

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	
	#future implementation
	#for a 0 to get_child_count()-1 / ownedInventories.append(get_child(a))
	ownedInventories.append(get_child(0))
	ownedInventories.append(get_child(1))

	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass


#archiwizing chages to items goes here WIP


#fragmenation check goes here WIP



#intercafe for inventory goes here

func loadToInventory(ItemData):
	#pass item data to inventory
	#check for sucess
	pass

#interface for item database goes here WIP
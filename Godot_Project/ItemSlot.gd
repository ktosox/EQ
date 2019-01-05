extends ColorRect

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var ItemType = Color()
var red 
var blue
var green

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	randomize()
	red=randf(100)
	#print(red)
	blue=randf(100)
	#print(blue)
	green=randf(100)
	#print(green)
	ItemType = Color(red,blue,green)
	color=ItemType
	print ("new ItemSlot created at ", self.rect_position.x," " , self.rect_position.y)
	#self.rect_global_position = Vector2(2,2)
	pass

func get_drag_data(position):
	print("drag started")
	var moving = ColorRect.new()
	moving.rect_size = Vector2(20,20)
	moving.color=color
	set_drag_preview(moving)
	return ItemType

func can_drop_data(position, data):
	return true

func drop_data(position, newItem):
	print(newItem)
	ItemType = newItem
	color = newItem
	pass


#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

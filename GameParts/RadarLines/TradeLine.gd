extends Line2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var scrollSpeed = 30
var scrollThreshold = 0.2
export var scrollMax = -300
var scrollCurrent = 0
export var value = 50.0

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.advance(randf()*20)
	$AnimationPlayer.playback_speed = randf()*2
	add_point(Vector2(0,value))
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.

func _process(delta):
	scrollCurrent += delta
	if(scrollCurrent>scrollThreshold):
		scrollCurrent-=scrollThreshold
		add_point(Vector2(0,value))
	for x in range(points.size()):
		points[x].x -=delta * scrollSpeed
	if(points[0].x < scrollMax):
		remove_point(0)
		
	pass


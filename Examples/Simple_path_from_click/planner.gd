extends Navigation2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	pass
	
func _input(event):
	if(event.is_action_pressed("LMB")):
		var target = get_global_mouse_position()
		target = get_closest_point(target)
		$Sprite2/Path2D.curve.clear_points()
		$Line2D.clear_points()
		var path = get_simple_path($Sprite.global_position,target,false)
		$Sprite.position = target
		for x in range(path.size()):
			$Line2D.add_point(path[x])
			$Sprite2/Path2D.curve.add_point(path[x])
		$Sprite2/Path2D/PathFollow2D/AnimationPlayer.play("move")


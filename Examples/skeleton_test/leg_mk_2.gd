extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var right = false

# Called when the node enters the scene tree for the first time.
func _ready():
	if (right):
		$Path2D/PathFollow2D/AnimationPlayer.advance(3.0)
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	#$Skeleton2D/Bone2D/Bone2D2/Bone2D3/Position2D.global_rotation = $Path2D/PathFollow2D.global_rotation

	pass

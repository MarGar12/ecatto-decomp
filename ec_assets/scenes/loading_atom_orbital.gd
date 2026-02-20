extends Sprite2D

var time = 0.0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	time += delta*3
	$e1.position.y = 50*sin(time+rotation)
	$e1.position.x = 50*cos(time+rotation)
	$e2.position = -$e1.position

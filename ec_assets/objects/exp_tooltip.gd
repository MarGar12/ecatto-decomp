extends Label


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if get_tree().paused or glob.inv_open: mouse_filter = Control.MOUSE_FILTER_IGNORE
	else: mouse_filter = Control.MOUSE_FILTER_PASS

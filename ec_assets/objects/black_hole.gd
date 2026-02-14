extends Area2D

class_name black_hole

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_mouse_entered():
	$info.show()
func _on_mouse_exited():
	$info.hide()

func _on_body_entered(body):
	if body != null:
		if body is element_catto: body.queue_free()
func _on_area_entered(area):
	if area != null:
		if area is particle: area.queue_free()

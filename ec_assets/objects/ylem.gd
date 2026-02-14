extends CharacterBody2D

var dragged = false

func _physics_process(_delta):
	#delete when resetting
	if Input.is_action_just_pressed("R"): queue_free()
	
	if $info.visible == true and Input.is_action_pressed("lmb"): 
		dragged = true
		glob.dragging = true
	if Input.is_action_just_released("lmb"):
		dragged = false
		glob.dragging = false
	if dragged == true: velocity = (get_global_mouse_position() - position)*10

	move_and_slide()

	if glob.t_power < 13.5: plasma()
	
	#using tools
	if $info.visible == true and Input.is_action_just_pressed("lmb"):
		if glob.tool == 6:
			var newlem = duplicate()
			newlem.position = position + Vector2(0,-192)
			add_sibling(newlem)
		if glob.tool == 7:
			queue_free()

func plasma():
	var scene = load("res://ec_assets/objects/quark_gluon_plasma.tscn")
	var instance = scene.instantiate()
	instance.position.x = position.x
	instance.position.y = position.y
	add_sibling(instance)
	queue_free()

func _on_mouse_entered():
	$info.show()
func _on_mouse_exited():
	$info.hide()


func _on_body_entered(_body: Node2D) -> void:
	pass # Replace with function body.

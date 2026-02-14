extends CharacterBody2D

class_name QGP

var dragged = false

func _ready():
	$flash.modulate.a = 1

func _physics_process(_delta):
	#delete when resetting
	if Input.is_action_just_pressed("R"): queue_free()
	
	#if $flash.modulate.a > 0: $flash.modulate.a -= delta*4
	
	velocity.x = randf_range(-10,10) * glob.t_power
	velocity.y = randf_range(-10,10) * glob.t_power
	
	if $info.visible == true and Input.is_action_pressed("lmb"):
		dragged = true
		glob.dragging = true
	if Input.is_action_just_released("lmb"):
		dragged = false
		glob.dragging = false
	if dragged == true: velocity = (get_global_mouse_position() - position)*10

	move_and_slide()
	
	if glob.t_power < 9.5: hydrogenize()
	if glob.t_power > 13.5: ylem()
	
	#using tools
	if $info.visible == true and Input.is_action_just_pressed("lmb"):
		if glob.tool == 6:
			var newqgp = duplicate()
			newqgp.position = position + Vector2(0,-192)
			add_sibling(newqgp)
		if glob.tool == 7:
			queue_free()

func hydrogenize():
	var scene = load("res://ec_assets/objects/element_catto.tscn")
	var instance = scene.instantiate()
	instance.position.x = position.x
	instance.position.y = position.y
	instance.protons = 1
	instance.neutrons = 0
	instance.electrons = 1
	add_sibling(instance)
	queue_free()

func ylem():
	var scene = load("res://ec_assets/objects/ylem.tscn")
	var instance = scene.instantiate()
	instance.position.x = position.x
	instance.position.y = position.y
	add_sibling(instance)
	queue_free()

func _on_mouse_entered():
	$info.show()
func _on_mouse_exited():
	$info.hide()

func _on_body_entered(body):
	if body != null:
		if body is QGP and velocity.length() > body.velocity.length():
			$flash.modulate.a = 1
			$blorp.play()
			body.queue_free()

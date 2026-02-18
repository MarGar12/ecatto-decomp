class_name electron_ball extends CharacterBody2D


var dragged:bool = false

func destroy():
	queue_free()

func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("R"):
		queue_free()
	
	velocity.y += glob.gravity*100 * delta * glob.rate

	if glob.tool == 7 and Input.is_action_pressed("lmb"):
		velocity += (get_global_mouse_position()-position).normalized()/(get_global_mouse_position()-position).length()*delta*100000
		if (get_global_mouse_position()-position).length() < 64: destroy()
	if glob.selected == self and Input.is_action_pressed("lmb"):
		dragged = true
		glob.dragging = true

	if dragged:
		velocity = (get_global_mouse_position() - position) * 5
	
	if Input.is_action_just_released("lmb"):
		dragged = false
		glob.dragging = false

	rotation += velocity.x / 1000

	var collision = move_and_collide(velocity * delta)
	if collision:
		velocity = velocity.bounce(collision.get_normal())
		velocity /= 1.1
		
		
func _on_mouse_entered() -> void:
	glob.selected = self
func _on_mouse_exited() -> void:
	glob.selected = null

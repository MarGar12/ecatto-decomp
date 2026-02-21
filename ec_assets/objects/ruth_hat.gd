class_name ruthenium_hat extends CharacterBody2D

var dragged:bool

func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("R"):
		queue_free()

	velocity.y += glob.gravity * 100 * delta * glob.rate
	
	if glob.tool == 7 and Input.is_action_pressed("lmb"):
		velocity += (get_global_mouse_position()-position).normalized()/(get_global_mouse_position()-position).length()*delta*100000
		if (get_global_mouse_position()-position).length() < 64: queue_free()
	
	if glob.selected == self and Input.is_action_pressed("lmb"):
		dragged = true
		glob.dragging = true

	if dragged:
		velocity = (get_global_mouse_position() - position) * 5
	
	if Input.is_action_just_released("lmb"):
		dragged = false
		glob.dragging = false
	
	var collision = move_and_collide(velocity * delta)
	if collision:
		if collision.get_collider() is StaticBody2D:
			var collbody:StaticBody2D = collision.get_collider()
			if collbody.name != "floor":
				velocity = velocity.slide(collision.get_normal())
		if collision.get_collider() is element_catto:
			var collbody:element_catto = collision.get_collider()
			velocity = collbody.velocity
			
		rotation = collision.get_angle()


func _on_mouse_entered() -> void:
	glob.selected = self

func _on_mouse_exited() -> void:
	glob.selected = null

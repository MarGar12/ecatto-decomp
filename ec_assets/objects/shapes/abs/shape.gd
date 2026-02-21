class_name Shape extends CharacterBody2D

var dragged:bool

func _init() -> void: # hack to force it On
	input_pickable = true
	
func _physics_process(delta: float) -> void:
	if Input.is_action_pressed("R"):
		queue_free()

	if glob.selected == self and Input.is_action_pressed("lmb"):
		dragged = true
		glob.dragging = dragged
	if Input.is_action_just_released("lmb"):
		dragged = false 
		glob.dragging = dragged
	
	if dragged:
		velocity = (get_global_mouse_position() - position) * 5
	
	if glob.tool == 7 and Input.is_action_pressed("lmb"):
		velocity += (get_global_mouse_position()-position).normalized()/(get_global_mouse_position()-position).length()*delta*100000
		if (get_global_mouse_position()-position).length() < 64: queue_free()
	if glob.tool == 6 and Input.is_action_just_pressed("lmb"):
		if (get_global_mouse_position()-position).length() < 64: 
			spawn_copy()
	
	velocity.y += glob.gravity * 100 * delta * glob.rate
	var coll:KinematicCollision2D = move_and_collide(velocity * delta)
	if coll:
		velocity = velocity.bounce(coll.get_normal())
		velocity /= 10
	

func spawn_copy(): #using the matter duplicator
	var new = self.duplicate()
	new.velocity.x = [-200,200].pick_random() * glob.rate
	new.position.y -= 200
	add_sibling.call_deferred(new)

func _mouse_enter() -> void:
	glob.selected = self
func _mouse_exit() -> void:
	glob.selected = null

class_name particle_ball extends CharacterBody2D

enum particle_type {ELECTRON, POSITRON}
var dragged:bool = false
var sound_played:bool = false
var balltype:int = 0

func set_appearance(type):
	match type:
		particle_type.ELECTRON:
			modulate = Color.WHITE
			$positron.visible = false
		particle_type.POSITRON:
			modulate = Color.RED
			$electron.visible = false
		

func _ready() -> void:
	set_appearance(balltype)

func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("R"):
		queue_free()
	
	if glob.tool == 7 and Input.is_action_pressed("lmb"):
		velocity += (get_global_mouse_position()-position).normalized()/(get_global_mouse_position()-position).length()*delta*100000
		if (get_global_mouse_position()-position).length() < 64: queue_free()
	if glob.selected == self and Input.is_action_pressed("lmb"):
		if glob.tool == 9:
			dragged = false
			glob.dragging = false
		else:
			dragged = true
			glob.dragging = true

	if dragged:
		velocity = (get_global_mouse_position() - position) * 5
	
	if Input.is_action_just_released("lmb"):
		dragged = false
		glob.dragging = false
		
	rotation += velocity.x / 1000
	
	velocity.y += glob.gravity*100 * delta * glob.rate
	#prints(glob.gravity*100 * delta * glob.rate, velocity.y)
	var collision = move_and_collide(velocity * delta)
	if collision:
		velocity = velocity.bounce(collision.get_normal())
		velocity.y /= 1.1

func _on_mouse_entered() -> void:
	glob.selected = self
func _on_mouse_exited() -> void:
	glob.selected = null


func _on_hitbox_body_entered(body: Node2D) -> void:
	if body is element_catto:
		velocity.y = body.velocity.y

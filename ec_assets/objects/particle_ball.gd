class_name particle_ball extends CharacterBody2D

enum particle_type {ELECTRON, POSITRON}
var dragged:bool = false
var sound_played:bool = false
var balltype:int = 0
var attract = null
var repel = null
func set_appearance(type):
	match type:
		particle_type.ELECTRON:
			modulate = Color.WHITE
			$positron.visible = false
			$electron.visible = true
		particle_type.POSITRON:
			modulate = Color.RED
			$electron.visible = false
			$positron.visible = true
		

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

	if balltype == particle_type.ELECTRON:
		if attract != null:
			velocity.x -= (cos((position-attract.position).angle()) * 100 / position.distance_squared_to(attract.position) * glob.rate) * absf(attract.affinity)
			velocity.y -= (sin((position-attract.position).angle()) * 100 / position.distance_squared_to(attract.position) * glob.rate) * absf(attract.affinity)

		if repel != null:
			velocity.x += (cos((position-repel.position).angle()) * 100 / position.distance_squared_to(repel.position) * glob.rate) * absf(repel.affinity)
			velocity.y += (sin((position-repel.position).angle()) * 100 / position.distance_squared_to(repel.position) * glob.rate) * absf(repel.affinity)

	var collision = move_and_collide(velocity * delta)
	if collision:
		if collision.get_collider() is element_catto:
			var col = collision.get_collider()
			col.velocity = velocity / 100
		velocity = velocity.bounce(collision.get_normal())
		velocity.y /= 1.1

func _on_mouse_entered() -> void:
	glob.selected = self
func _on_mouse_exited() -> void:
	glob.selected = null

func _on_range_body_entered(body: Node2D) -> void:
	if body is element_catto:
		if balltype == particle_type.ELECTRON:
			match int(sign(body.affinity)):
				-1: repel = body
				1: attract = body

func _on_range_body_exited(body: Node2D) -> void:
	if body is element_catto:
		if balltype == particle_type.ELECTRON:
			match int(sign(body.affinity)):
				-1: repel = null
				1: attract = null

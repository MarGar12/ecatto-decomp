extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$range/col.disabled = !glob.explosions
	
	if glob.explosions == true:
		$sound.pitch_scale = randf_range(0.8,1)
		$sound.play()
		$smoke.emitting = true
		$sparks.emitting = true
	else:
		$pop.play()
		$poof.emitting = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if glob.explosions == true and $smoke.emitting == false: queue_free()
	if glob.explosions == false and $poof.emitting == false: queue_free()
	$range.scale /= 2


func _on_range_body_entered(body):
	if body != null:
		if body is purrcent: 
			body.spawn_catto(8,8,8)
			body.spawn_catto(7,7,7)
			body.spawn_catto(6,6,6)
			body.spawn_catto(1,0,1)
			body.destroy("poof")
		if body is element_catto or body is compound_catto:
			body.position.y -= 5
			body.velocity = -(global_position-body.global_position).normalized()*1000 * glob.rate
			if body.group != "noble gas": body.knocked_out = randf_range(2,6)
			if glob.catto_rotat == true: body.rotation_degrees += randf_range(30,180) * [-1,1].pick_random()

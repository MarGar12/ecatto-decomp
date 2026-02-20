extends CPUParticles2D

# Called when the node enters the scene tree for the first time.
func _ready():
	emitting = true
	$poof.play(0.05)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if emitting == false: queue_free()

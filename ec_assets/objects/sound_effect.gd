extends AudioStreamPlayer2D

var base_vol = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	base_vol = volume_db


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	volume_db = base_vol - (1-glob.sfx_volume)**4 * 80

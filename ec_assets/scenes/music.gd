extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	[$a,$b,$c,$d,$e,$f,$g,$h,$i,$j].pick_random().play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func _on_track_finished():
	[$a,$b,$c,$d,$e,$f,$g,$h,$i,$j].pick_random().play()

extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$gui/fps.text = str(Engine.get_frames_per_second()).pad_decimals(0) + " 	FPS " + str(Engine.get_frames_drawn()).pad_decimals(0)

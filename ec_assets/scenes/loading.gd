extends Node2D

var loading_status : int
var progress : Array[float]

# Called when the node enters the scene tree for the first time.
func _ready():
	ResourceLoader.load_threaded_request("res://ec_assets/scenes/main.tscn")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Label.self_modulate.a += (1-$Label.self_modulate.a)*delta*3
	if $bg.self_modulate.v < 0.2: $bg.self_modulate.v += delta/100
	$atom.modulate.a = $bg.self_modulate.v*2
	
	loading_status = ResourceLoader.load_threaded_get_status("res://ec_assets/scenes/main.tscn", progress)
	$Label.text = str(floor(progress[0]*100)).pad_decimals(0) + "%"
	if ResourceLoader.load_threaded_get_status("res://ec_assets/scenes/main.tscn") == ResourceLoader.THREAD_LOAD_LOADED:
		ResourceLoader.load_threaded_request("res://ec_assets/scenes/earth_explodes.tscn")
	if ResourceLoader.load_threaded_get_status("res://ec_assets/scenes/earth_explodes.tscn") == ResourceLoader.THREAD_LOAD_LOADED:
		get_tree().change_scene_to_packed(ResourceLoader.load_threaded_get("res://ec_assets/scenes/main.tscn"))

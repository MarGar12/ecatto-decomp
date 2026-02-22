extends Node

var config = ConfigFile.new() # Config values
var path = "user://settings.cfg"
var err = config.load("user://settings.cfg")

var camera = null
var selected = null

var rate = 1.0
var temperature = 293.15
var t_power = 0.0
var pressure = 1.0
var air_density = 1.3
var gravity = 9.81
var dragging = false
var lcdrag = false

var spawning = null
var inv_open = false
var spawn_nucleus = false
@warning_ignore("shadowed_global_identifier")
var tool = 0

var cattos = 0
var particles = 0

var pause = false
var explosions = true
var opaquewalls = false
var music_volume = 1.0
var sfx_volume = 1.0
var t_speed = 1.0
var fusion_threshold = 1.0
var weakforce = true
var endable_world = true
var hudscaling = true
var poof = true
var catto_ai = true
var catto_rotat = true

var chemistry = false

var helpmode = false
var tutorial = true
var earth_exploded = false

var hudparency = 1.0

# play area variables
var box_x = 2500.0
var box_y = 0.0

var lowperf = false
var frameskip = false
var explosion = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	OS.request_permissions()
	load_cfg()
	if glob.lowperf == true:
		Engine.physics_ticks_per_second = 15
	else:
		Engine.physics_ticks_per_second = 60
	if glob.frameskip == true:
		Engine.max_physics_steps_per_frame = 8
	else:
		Engine.max_physics_steps_per_frame = 1
	if err != OK:
		pass
	
		
func save():
	config.load(path)
	config.set_value("Audio", "music_volume", music_volume)
	config.set_value("Audio", "sfx_volume", sfx_volume)
	config.set_value("Gameplay", "earth_exploded", earth_exploded)
	config.set_value("Gameplay", "fusion_threshold", fusion_threshold)
	config.set_value("Gameplay", "poof", poof)
	config.set_value("Gameplay", "t_speed", t_speed)
	config.set_value("Gameplay", "explosions", explosions)
	config.set_value("Gameplay", "opaquewalls", opaquewalls)
	config.set_value("Gameplay", "catto_ai", catto_ai)
	config.set_value("Gameplay", "catto_rotat", catto_rotat)
	config.set_value("Gameplay", "tutorialpressed", tutorial)
	config.set_value("Gameplay", "endable_world", endable_world)
	config.set_value("Gameplay", "weakforce", weakforce)
	config.set_value("Gameplay", "box_x", box_x)
	config.set_value("Gameplay", "box_y", box_y)
	config.set_value("Video", "left_click_drag", lcdrag)
	config.set_value("Video", "hudscaling", hudscaling)
	config.set_value("Video", "hud_transparency", hudparency)
	config.set_value("Video", "lowperf", lowperf)
	config.set_value("Video", "frameskip", frameskip)
	config.save(path)
	
func load_cfg():
	config.load(path)
	music_volume = config.get_value("Audio", "music_volume", 1.0)
	sfx_volume = config.get_value("Audio", "sfx_volume", 1.0)
	earth_exploded = config.get_value("Gameplay", "earth_exploded", false)
	fusion_threshold = config.get_value("Gameplay", "fusion_threshold", 1.0)
	poof = config.get_value("Gameplay", "poof", true)
	t_speed = config.get_value("Gameplay", "t_speed", 1.0)
	explosions = config.get_value("Gameplay", "explosions", true)
	opaquewalls = config.get_value("Gameplay", "opaquewalls", false)
	catto_ai = config.get_value("Gameplay", "catto_ai", true)
	catto_rotat = config.get_value("Gameplay", "catto_rotat", true)
	tutorial = config.get_value("Gameplay", "tutorialpressed", true)
	endable_world = config.get_value("Gameplay", "endable_world", true)
	weakforce = config.get_value("Gameplay", "weakforce", true)
	box_x = config.get_value("Gameplay", "box_x", 2500.0)
	box_y = config.get_value("Gameplay", "box_y", 0.0)
	lcdrag = config.get_value("Video", "left_click_drag", false)
	hudscaling = config.get_value("Video", "hudscaling", true)
	hudparency = config.get_value("Video", "hud_transparency", 1.0)
	lowperf = config.get_value("Video", "lowperf", false)
	frameskip = config.get_value("Video", "frameskip", false)
	
func _notification(what):
	if what == NOTIFICATION_WM_CLOSE_REQUEST:
		save()
		
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("Fullscreen"):
		var winmode := DisplayServer.window_get_mode()
		var is_window: bool = winmode != DisplayServer.WINDOW_MODE_FULLSCREEN
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN if is_window else DisplayServer.WINDOW_MODE_WINDOWED)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if !OS.has_feature("movie"):
		get_window().title = "Element Cattos Decomp (" + str(Engine.get_frames_per_second()).pad_decimals(0) + " FPS)"

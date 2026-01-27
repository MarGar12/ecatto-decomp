extends Node

var camera = null
var selected = null

var rate = 1.0
var temperature = 293.15
var t_power = 0.0
var pressure = 1.0
var air_density = 1.3
var gravity = 9.81

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
var poof = true
var catto_ai = true
var catto_rotat = true

var chemistry = false

var helpmode = false
var tutorial = true
var earth_exploded = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

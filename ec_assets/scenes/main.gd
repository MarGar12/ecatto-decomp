extends Node2D

var bigbang = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	preload("res://ec_assets/objects/element_catto.tscn")
	
	glob.pause = false
	glob.cattos = 0
	glob.particles = 0
	get_window().title = "Element Cattos Decomp"


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#debug stuff
	get_window().title = "Element Cattos Decomp (" + str(Engine.get_frames_per_second()).pad_decimals(0) + " FPS) [" + str(Engine.get_frames_drawn()).pad_decimals(0) + "]"
	
	$hint.visible = glob.tutorial
	$air.self_modulate.a = glob.pressure/5.0
	$air.texture.noise.offset.z += delta*10
	$air/heat.advance(glob.t_power*0.1+0.2-$air/heat.current_animation_position)
	
	glob.t_power = clamp(glob.t_power,-30,29.5)
	#glob.t_power /= 1+delta*glob.pressure/100.0
	
	if glob.t_power > 15:
		if $rumble.playing == false: $rumble.play()
		$rumble.volume_db = glob.t_power-35
		$camera.position.x += randf_range(-glob.t_power+15,glob.t_power-15)
		$camera.position.y += randf_range(-glob.t_power+15,glob.t_power-15)
	
	if glob.t_power > 29.49 and glob.pressure > 0 and bigbang == 0:
		spawn("big_bang",0,-1024)
		spawn("ylem",0,-1024)
		bigbang = 1
	if bigbang > 0: 
		bigbang -= delta/10.0
		glob.t_power /= 1+delta*0.2
	
	#ideal gas law
	glob.air_density = (glob.pressure*10000*30/1000.0)/(8.314*glob.temperature)*10
	
	#backgrounds
	$walls/opaque.visible = glob.opaquewalls
	
	$bg/moon.visible = $camera.preset == 2
	$bg/moon/space.position = $camera.position
	$bg/moon/stars.position = $camera.position/1.01
	$bg/moon/earth.position = $camera.position/1.05
	$bg/moon/terrain.position.x = $camera.position.x/2.0
	
	$bg/space.visible = $camera.preset == 3
	$bg/space/space.position = $camera.position
	$bg/space/stars.position = $camera.position/1.01
	$bg/space/nebula.position = $camera.position/1.05
	
	$bg/sun.visible = $camera.preset == 4
	$bg/sun/space.position = $camera.position
	$bg/sun/plasma.position = $camera.position/1.5
	$bg/sun/sun.position = $camera.position/1.5

func spawn(obj,x,y):
	var scene = load("res://ec_assets/objects/"+obj+".tscn")
	var instance = scene.instantiate()
	instance.position.x = x
	instance.position.y = y
	add_child(instance)

func _on_ok_pressed():
	glob.tutorial = false

func _on_xmasart_pressed():
	$walls/opaque/xmas_art.visible = !$walls/opaque/xmas_art.visible
	if $walls/opaque/xmas_art.visible: $walls/opaque/xmasart.text = "Christmas Art: on"
	else: $walls/opaque/xmasart.text = "Christmas Art: off"

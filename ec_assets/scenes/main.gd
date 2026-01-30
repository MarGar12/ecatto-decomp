extends Node2D

var bigbang = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	preload("res://ec_assets/objects/element_catto.tscn")
	preload("res://ec_assets/scenes/main.tscn")
	
	glob.pause = false
	glob.cattos = 0
	glob.particles = 0
	get_window().title = "Element Cattos Decomp"
	
	#flying kitty stuff
	# var sector = Vector2.ZERO
	# var proc = FastNoiseLite.new()
	# var color = Vector2.ZERO
	for c in range(25):
		var cloud = $bg/earth_fk/cloud_front/cloud1.duplicate()
		cloud.visible = true
		cloud.position.x = randf_range(-15000,15000)
		cloud.position.y = randf_range(-400,0)
		cloud.scale *= randf_range(1,2)
		cloud.flip_h = [true,false].pick_random()
		$bg/earth_fk/cloud_front.add_child(cloud)
		var cloud4 = $bg/earth_fk/cloud_front4/cloud1.duplicate()
		cloud4.visible = true
		cloud4.position.x = randf_range(-15000,15000)
		cloud4.position.y = randf_range(-800,-200)
		cloud4.scale *= randf_range(1,2)
		cloud4.flip_h = [true,false].pick_random()
		$bg/earth_fk/cloud_front4.add_child(cloud4)
		var cloud3 = $bg/earth_fk/cloud_front3/cloud1.duplicate()
		cloud3.visible = true
		cloud3.position.x = randf_range(-15000,15000)
		cloud3.position.y = randf_range(-600,-200)
		cloud3.scale *= randf_range(0,1.5)
		cloud3.flip_h = [true,false].pick_random()
		$bg/earth_fk/cloud_front3.add_child(cloud3)
	for c in range(38):
		var cloud = $bg/earth_fk/cloud_front2/cloud1.duplicate()
		cloud.visible = true
		cloud.position.x = randf_range(-30000,30000)
		cloud.position.y = randf_range(-600,-400)
		cloud.scale *= randf_range(0,1)
		cloud.flip_h = [true,false].pick_random()
		$bg/earth_fk/cloud_front2.add_child(cloud)
	for c in range(30):
		var mountain = $bg/earth_fk/mountains/mount.duplicate()
		mountain.visible = true
		mountain.position.x = randf_range(-10500,15000)
		mountain.scale *= randf_range(0.5,1.5)
		mountain.flip_h = [true,false].pick_random()
		$bg/earth_fk/mountains.add_child(mountain)
		var mountain2 = $bg/earth_fk/mountains2/mount.duplicate()
		mountain2.visible = true
		mountain2.position.x = randf_range(-10500,10500)
		mountain2.scale *= randf_range(0.5,1.5)
		mountain2.flip_h = [true,false].pick_random()
		$bg/earth_fk/mountains2.add_child(mountain2)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#debug stuff
	get_window().title = "Element Cattos Decomp (" + str(Engine.get_frames_per_second()).pad_decimals(0) + " FPS)"
	
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
	
	$bg/earth_fk.visible = $camera.preset == 1
	$"bg/earth_fk/cloud_front2/.".position = $camera.position/1.01
	$"bg/earth_fk/cloud_front3/.".position = $camera.position/1.05
	$"bg/earth_fk/cloud_front/.".position = $camera.position/1.09
	$"bg/earth_fk/cloud_front4/.".position = $camera.position/1.2
	
	$bg/earth_fk/ground3/grass_far.position = $camera.position*0.8+Vector2(0,250)
	$bg/earth_fk/ground3/grass_far2.position = $camera.position*0.9+Vector2(0,200)
	$bg/earth_fk/ground3/grass_bg.position.x = $camera.position.x/2.0
	#$bg/earth_fk/ground3/grass_far.scale = $camera.zoom * 1.01
	#$bg/earth_fk/ground3/grass_far2.scale = $camera.zoom * 1.01
	$"bg/earth_fk/mountains/.".position.x = $camera.position.x/1.01
	$"bg/earth_fk/mountains/.".position.y = ($camera.position.y+72)/1.01
	$"bg/earth_fk/mountains2/.".position.x = $camera.position.x/1.04
	$"bg/earth_fk/mountains2/.".position.y = ($camera.position.y+72)/1.04
	$bg/earth_fk/sky.position.x = $camera.position.x/1.001
	$bg/earth_fk/sky.position.y = ($camera.position.y-1000)/1.01
	$bg/earth_fk/stars2.position.x = $camera.position.x/1.001
	$bg/earth_fk/stars2.position.y = ($camera.position.y/1.001)-5000
	
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

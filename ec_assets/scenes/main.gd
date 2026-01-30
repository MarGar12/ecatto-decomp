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
		var cloud = $bg/earth_fk/ground3/cloud_front1/cloud1.duplicate() # dupe the frontest cloud
		cloud.visible = true
		cloud.position.x = randf_range(-15000,15000)
		cloud.position.y = randf_range(-800,-200)
		cloud.scale *= randf_range(1,2)
		cloud.flip_h = [true,false].pick_random()
		$bg/earth_fk/ground3/cloud_front1.add_child(cloud)
		var cloud2 = $bg/earth_fk/ground3/cloud_front2/cloud1.duplicate() # dupe back front cloud
		cloud2.visible = true
		cloud2.position.x = randf_range(-15000,15000)
		cloud2.position.y = randf_range(-800,-200)
		cloud2.scale *= randf_range(1,2)
		cloud2.flip_h = [true,false].pick_random()
		$bg/earth_fk/ground3/cloud_front2.add_child(cloud2)
		var cloud3 = $bg/earth_fk/ground3/cloud_front3/cloud1.duplicate() # dupe most back front cloud
		cloud3.visible = true
		cloud3.position.x = randf_range(-15000,15000)
		cloud3.position.y = randf_range(-800,-200)
		cloud3.scale *= randf_range(0,1.5)
		cloud3.flip_h = [true,false].pick_random()
		$bg/earth_fk/ground3/cloud_front3.add_child(cloud3)
	for c in range(38): # dupe back clouds
		var cloud = $bg/earth_fk/cloud_back/cloud1.duplicate()
		cloud.visible = true
		cloud.position.x = randf_range(-30000,30000)
		cloud.position.y = randf_range(-600,-400)
		cloud.scale *= randf_range(0,1)
		cloud.flip_h = [true,false].pick_random()
		$bg/earth_fk/cloud_back.add_child(cloud)
	for c in range(15): # mountain dupesw
		var mountain = $bg/earth_fk/mountains/mount.duplicate() # back mountains
		mountain.visible = true
		mountain.position.x = randf_range(-10500,15000)
		mountain.scale *= randf_range(0.5,1.5)
		mountain.flip_h = [true,false].pick_random()
		$bg/earth_fk/mountains.add_child(mountain)
		var mountain2 = $bg/earth_fk/mountains2/mount.duplicate() # front mountains
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
	
	#background visibility
	$walls/opaque.visible = glob.opaquewalls
	$bg/earth_fk.visible = $camera.preset == 1
	$bg/moon.visible = $camera.preset == 2
	$bg/space.visible = $camera.preset == 3
	$bg/sun.visible = $camera.preset == 4
	
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

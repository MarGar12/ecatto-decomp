extends Node2D

var facts = [ # Formatting yay :3
	"Muonium is an exotic element, one of several that you won't find on a real periodic table.",
	"The most common form of Hydrogen is Protium, an atom with one proton, one electron and no neutrons.",
	"Helium's freezing temperature is normally below absolute zero, which means solid Helium is normally impossible.",
	"Lithium and other alkali metals are very reactive, catching fire or even exploding on contact with water.",
	"Pure beryllium is grey. The catto's color is based on emerald, which contains beryllium.",
	"Boron cannot be naturally created through nuclear fusion in stars; he is only produced by cosmic rays and supernovae.",
	"Carbon is the fourth most common element in the universe.",
	"Nitrogen is called Azote in some languages, which means ''no life'' in Ancient Greek.",
	"Oxygen is the third most common element in the universe.",
	"Fluorine is one of the few gases that actually have a colour, in this case a very pale yellow.",
	"Noble gases like Neon never burn.","Sodium is monoisotopic - he only has one stable form, Sodium-23.",
	"Magnesium is good for your body! You can find her in most fruits and vegetables.",
	"Aluminium won't protect you from aliens, sorry.",
	"Silicon is in your walls.",
	"Phosphorus is one of the six most common elements in living things, the others being Hydrogen, Carbon, Nitrogen, Oxygen and Sulfur.",
	"Sulfur tends to form eight-atom rings; she's called Octasulfur when she does that.",
	"Chlorine is a halogen, meaning she's extremely reactive and pretty dangerous. That's why she is used to kill bacteria in pools.",
	"Argon is the third most common element in Earth's atmosphere, after Nitrogen and Oxygen.",
	"Bananas contain a tiny bit of antimatter thanks to Potassium-40, who lives in them and spits out positrons.",
	"Calcium is found not only in milk and bones, but also deep inside the Earth's core.",
	"Science is awesome!"
	]

var base_vol = 0
var volume_db = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	base_vol = volume_db
	$music.volume_db = base_vol - (1-glob.music_volume)**4 * 80
	var white = Color(1.0, 1.0, 1.0, 1.0)
	var black = Color(0,0,0,1)
	var bob = randi_range(0,1)
	var bob2 = randi_range(1,3)
	if bob == 1:
		$anim.play("bob2")
	if bob2 == 1:
		#$main/logo/version.set("theme_override_colors/font_color", white)
		$main/play.set("theme_override_colors/font_color", white)
		$main/settings.set("theme_override_colors/font_color", white)
		$settings/about.set("theme_override_colors/font_color", white)
		$main/decompcredits.set("theme_override_colors/font_color", white)
		$main/credits.set("theme_override_colors/font_color", white)
		$main/quit.set("theme_override_colors/font_color", white)
		#$main/fact.set("theme_override_colors/font_color", white)
		$about/text.set("theme_override_colors/font_color", white)
		$credits/text.set("theme_override_colors/default_color", white)
		$decompcredits/text.set("theme_override_colors/default_color", white)
		$about/back.set("theme_override_colors/font_color", white)
		$credits/back.set("theme_override_colors/font_color", white)
		$decompcredits/back.set("theme_override_colors/font_color", white)
		$credits/about.set("theme_override_colors/font_color", white)
		$decompcredits/about.set("theme_override_colors/font_color", white)
		$earth_fk.hide()
		$space.hide()
		$moon.show()
		$particles.hide()
	if bob2 == 2:
		#$main/fact/logo/version.set("theme_override_colors/font_color", black)
		$main/play.set("theme_override_colors/font_color", black)
		$main/settings.set("theme_override_colors/font_color", black)
		$settings/about.set("theme_override_colors/font_color", black)
		$main/decompcredits.set("theme_override_colors/font_color", black)
		$main/credits.set("theme_override_colors/font_color", black)
		$main/quit.set("theme_override_colors/font_color", black)
		$main/fact.set("theme_override_colors/font_color", black)
		$about/text.set("theme_override_colors/font_color", black)
		$credits/text.set("theme_override_colors/default_color", black)
		$decompcredits/text.set("theme_override_colors/default_color", black)
		$about/back.set("theme_override_colors/font_color", black)
		$credits/back.set("theme_override_colors/font_color", black)
		$decompcredits/back.set("theme_override_colors/font_color", black)
		$credits/about.set("theme_override_colors/font_color", black)
		$decompcredits/about.set("theme_override_colors/font_color", black)
		$earth_fk.show()
		$moon.hide()
		$space.hide()
		$particles.show()
	if bob2 == 3:
		#$main/logo/version.set("theme_override_colors/font_color", white)
		$main/play.set("theme_override_colors/font_color", white)
		$main/settings.set("theme_override_colors/font_color", white)
		$settings/about.set("theme_override_colors/font_color", white)
		$main/decompcredits.set("theme_override_colors/font_color", white)
		$main/credits.set("theme_override_colors/font_color", white)
		$main/quit.set("theme_override_colors/font_color", white)
		$main/fact.set("theme_override_colors/font_color", white)
		$about/text.set("theme_override_colors/font_color", white)
		$credits/text.set("theme_override_colors/default_color", white)
		$decompcredits/text.set("theme_override_colors/default_color", white)
		$about/back.set("theme_override_colors/font_color", white)
		$credits/back.set("theme_override_colors/font_color", white)
		$decompcredits/back.set("theme_override_colors/font_color", white)
		$credits/about.set("theme_override_colors/font_color", white)
		$decompcredits/about.set("theme_override_colors/font_color", white)
		$earth_fk.hide()
		$moon.hide()
		$space.show()
		$particles.hide()
		
	sync_options()
	
	$main/fact.text = "[wave amp=25.0 freq=1.0 connected=1][color=yellow]Random Science Fact:\n" + facts.pick_random()
	
	# BG :3
	for c in range(25):
		var cloud = $earth_fk/ground3/cloud_front1/cloud1.duplicate() # dupe the frontest cloud
		cloud.visible = true
		cloud.position.x = randf_range(-15000,15000)
		cloud.position.y = randf_range(-300,-100)
		cloud.scale *= randf_range(1,2)
		cloud.flip_h = [true,false].pick_random()
		$earth_fk/ground3/cloud_front1.add_child(cloud)
		var cloud2 = $earth_fk/ground3/cloud_front2/cloud1.duplicate() # dupe back front cloud
		cloud2.visible = true
		cloud2.position.x = randf_range(-15000,15000)
		cloud2.position.y = randf_range(-300,-100)
		cloud2.scale *= randf_range(1,2)
		cloud2.flip_h = [true,false].pick_random()
		$earth_fk/ground3/cloud_front2.add_child(cloud2)
		var cloud3 = $earth_fk/ground3/cloud_front3/cloud1.duplicate() # dupe most back front cloud
		cloud3.visible = true
		cloud3.position.x = randf_range(-15000,15000)
		cloud3.position.y = randf_range(-400,-200)
		cloud3.scale *= randf_range(0,1.5)
		cloud3.flip_h = [true,false].pick_random()
		$earth_fk/ground3/cloud_front3.add_child(cloud3)
	for c in range(38): # dupe back clouds
		var cloud = $earth_fk/cloud_back/cloud1.duplicate()
		cloud.visible = true
		cloud.position.x = randf_range(-30000,30000)
		cloud.position.y = randf_range(-150,-50)
		cloud.scale *= randf_range(0.1,1)
		cloud.flip_h = [true,false].pick_random()
		$earth_fk/cloud_back.add_child(cloud)
	for c in range(15): # mountain dupesw
		var mountain = $earth_fk/mountains/mount.duplicate() # back mountains
		mountain.visible = true
		mountain.position.x = randf_range(-10500,15000)
		mountain.scale *= randf_range(0.5,1.5)
		mountain.flip_h = [true,false].pick_random()
		$earth_fk/mountains.add_child(mountain)
		var mountain2 = $earth_fk/mountains2/mount.duplicate() # front mountains
		mountain2.visible = true
		mountain2.position.x = randf_range(-10500,10500)
		mountain2.scale *= randf_range(0.5,1.5)
		mountain2.flip_h = [true,false].pick_random()
		$earth_fk/mountains2.add_child(mountain2)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	scale = Vector2.ONE * (get_window().size.y/648.0)**0.5
	
	$snow.position.y = -get_window().size.y*0.5/scale.y
	$snow.scale.x = get_window().size.x/1000.0
	
	$earth.rotate(delta*0.05)
	$cattos1.rotate(-delta*0.2)
	$cattos2.rotate(delta*0.1)
	$cattos3.rotate(-delta*0.05)
	$cattos4.rotate(delta*0.025)
	$cattos3/lu/clock/text.text = Time.get_time_string_from_system()
	$cattos3/lu/clock/text.visible_characters = 5
	
	if $version/iris.visible == true:
		$version/iris.scale /= 1+delta*10
		$music.volume_db -= delta*20
	else:
		$music.volume_db = base_vol - (1-glob.music_volume)**4 * 80
	$hover.volume_db = base_vol - (1-glob.sfx_volume)**4 * 80
	$click.volume_db = base_vol - (1-glob.sfx_volume)**4 * 80
	if $version/iris.scale.x < 0.02: get_tree().change_scene_to_file("res://ec_assets/scenes/loading.tscn")
	
	# Update Settings Slider Values
	if glob.fusion_threshold < 3:
		$settings/tab/Gameplay/fusethres/value.text = "Fusion Threshold: " + str(glob.fusion_threshold)
	else:
		$settings/tab/Gameplay/fusethres/value.text = "No Fusion"
	$settings/tab/Audio/mvol/value.text = "Music Volume: " + str(glob.music_volume * 100).pad_decimals(0) + "%"
	$settings/tab/Audio/svol/value.text = "Sound Volume: " + str(glob.sfx_volume * 100).pad_decimals(0) + "%"
	$settings/tab/Gameplay/temp/value.text = "Temperature Slider Speed: " + str(glob.t_speed)
	$settings/tab/Gameplay/endworld.disabled = !glob.earth_exploded
	$settings/tab/Video/hudtrans/value.text = "HUD Transparency: " + str(glob.hudparency * 100).pad_decimals(0) + "%"
	if glob.box_x != 10000.1 and glob.box_y != 10000.1:
		$settings/tab/Gameplay/box_x/value.text = "Box Size: (W:" + str(glob.box_x) + ",H:" + str(glob.box_y).pad_decimals(1) + ")"
	elif glob.box_x != 10000.1 and glob.box_y == 10000.1:
		$settings/tab/Gameplay/box_x/value.text = "Box Size:(W:" + str(glob.box_x) + ",None)"
	elif glob.box_x == 10000.1 and glob.box_y != 10000.1:
		$settings/tab/Gameplay/box_x/value.text = "Box Size:(None,H:" + str(glob.box_y).pad_decimals(1) + ")"
	else:
		$settings/tab/Gameplay/box_x/value.text = "Only Floor Collision"
	
	if Input.is_action_just_pressed("esc") and not $main.visible:
		$click.play()
		_on_back_pressed()

func _on_play_pressed():
	$version/iris.show()

func _on_quit_pressed():
	glob.save()
	get_tree().quit()

func _on_settings_pressed():
	$main.hide()
	$settings.show()
	sync_options()
	#$logo.hide()

func _on_back_pressed():
	$settings.hide()
	$credits.hide()
	$decompcredits.hide()
	$main.show()
	$logo.show()
	sync_options()
	glob.save()

func _button_hover():
	$hover.play()
func _button_press():
	$click.play()

func _on_credits_pressed():
	$main.hide()
	$credits.show()
	$logo.hide()

func _on_decompcredits_pressed():
	$main.hide()
	$logo.hide()
	$decompcredits.show()


func _on_text_meta_clicked(meta: Variant) -> void:
	OS.shell_open(str(meta))

#settings
func _on_explode_toggled(button_pressed):
	glob.explosions = button_pressed

func _on_opaque_toggled(button_pressed):
	glob.opaquewalls = button_pressed

func _on_poof_toggled(button_pressed):
	glob.poof = button_pressed

func _on_weak_toggled(button_pressed):
	glob.weakforce = button_pressed

func _on_ai_toggled(button_pressed):
	glob.catto_ai = button_pressed

func _on_rotate_toggled(button_pressed):
	glob.catto_rotat = button_pressed

func _on_drag_toggled(button_pressed):
	glob.lcdrag = button_pressed

func _on_endworld_toggled(button_pressed):
	glob.endable_world = button_pressed
	
func _on_fusethres_value_changed(value):
	glob.fusion_threshold = value

func _on_temp_value_changed(value):
	glob.t_speed = value

func _on_scale_toggled(button_pressed):
	glob.hudscaling = button_pressed

func _on_svol_value_changed(value):
	glob.sfx_volume = value

func _on_mvol_value_changed(value):
	glob.music_volume = value
	
func _on_hudtrans_value_changed(value):
	glob.hudparency = value
	
func _on_box_x_value_changed(value):
	glob.box_x = value

func _on_box_y_value_changed(value):
	glob.box_y = value

func _on_lowperf_toggled(button_pressed):
	glob.lowperf = button_pressed
	if glob.lowperf == true:
		Engine.physics_ticks_per_second = 15
	else:
		Engine.physics_ticks_per_second = 60
	
func sync_options():
	$settings/tab/Gameplay/explode.button_pressed = glob.explosions
	$settings/tab/Gameplay/opaque.button_pressed = glob.opaquewalls
	$settings/tab/Gameplay/poof.button_pressed = glob.poof
	$settings/tab/Gameplay/weak.button_pressed = glob.weakforce
	$settings/tab/Gameplay/ai.button_pressed =  glob.catto_ai
	$settings/tab/Gameplay/rotate.button_pressed = glob.catto_rotat
	$settings/tab/Gameplay/drag.button_pressed = glob.lcdrag
	$settings/tab/Video/scale.button_pressed = glob.hudscaling
	$settings/tab/Gameplay/fusethres.value = glob.fusion_threshold
	$settings/tab/Gameplay/temp.value = glob.t_speed
	$settings/tab/Audio/svol.value = glob.sfx_volume
	$settings/tab/Audio/mvol.value = glob.music_volume
	$settings/tab/Gameplay/endworld.button_pressed = glob.endable_world
	$settings/tab/Video/hudtrans.value = glob.hudparency
	$settings/tab/Gameplay/box_x.value = glob.box_x
	$settings/tab/Gameplay/box_y.value = glob.box_y
	$settings/tab/Video/lowperf.button_pressed = glob.lowperf

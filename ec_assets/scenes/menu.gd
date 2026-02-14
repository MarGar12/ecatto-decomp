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

# Called when the node enters the scene tree for the first time.
func _ready():
	var white = Color(1.0, 1.0, 1.0, 1.0)
	var black = Color(0,0,0,1)
	var bob = randi_range(0,1)
	var bob2 = randi_range(1,3)
	if bob == 1:
		$anim.play("bob2")
	if bob2 == 1:
		#$main/logo/version.set("theme_override_colors/font_color", white)
		$main/play.set("theme_override_colors/font_color", white)
		$main/about.set("theme_override_colors/font_color", white)
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
		$earth_fk.hide()
		$space.hide()
		$moon.show()
		$particles.hide()
	if bob2 == 2:
		#$main/fact/logo/version.set("theme_override_colors/font_color", black)
		$main/play.set("theme_override_colors/font_color", black)
		$main/about.set("theme_override_colors/font_color", black)
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
		$earth_fk.show()
		$moon.hide()
		$space.hide()
		$particles.show()
	if bob2 == 3:
		#$main/logo/version.set("theme_override_colors/font_color", white)
		$main/play.set("theme_override_colors/font_color", white)
		$main/about.set("theme_override_colors/font_color", white)
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
		$earth_fk.hide()
		$moon.hide()
		$space.show()
		$particles.hide()
	
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
	if $version/iris.scale.x < 0.02: get_tree().change_scene_to_file("res://ec_assets/scenes/loading.tscn")
	$debug/fps.text = str(Engine.get_frames_per_second()).pad_decimals(0) + " FPS\n"

func _on_play_pressed():
	$version/iris.show()

func _on_quit_pressed():
	get_tree().quit()

func _on_about_pressed():
	$main.hide()
	$about.show()
	$logo.hide()

func _on_back_pressed():
	$about.hide()
	$credits.hide()
	$decompcredits.hide()
	$main.show()
	$logo.show()

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

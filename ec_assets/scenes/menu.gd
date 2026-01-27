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
	var bob2 = randi_range(0,2)
	if bob2 == 0: $anim.play("bob2")
	if bob2 == 1:
		$earth.show()
		$particles.hide()
	
	$main/fact.text = "Fact of the day:\n" + facts.pick_random()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	scale = Vector2.ONE * (get_window().size.y/648.0)**0.5
	
	$snow.position.y = -get_window().size.y*0.5/scale.y
	$snow.scale.x = get_window().size.x/1000.0
	$main/happyholidays.position = get_window().size*0.5/scale.x
	
	$earth.rotate(delta*0.05)
	$cattos1.rotate(-delta*0.2)
	$cattos2.rotate(delta*0.1)
	$cattos3.rotate(-delta*0.05)
	$cattos4.rotate(delta*0.025)
	$cattos3/lu/clock/text.text = Time.get_time_string_from_system()
	$cattos3/lu/clock/text.visible_characters = 5
	
	if $iris.visible == true:
		$iris.scale /= 1+delta*10
		$music.volume_db -= delta*20
	if $iris.scale.x < 0.02: get_tree().change_scene_to_file("res://ec_assets/scenes/loading.tscn")

func _on_play_pressed():
	$iris.show()

func _on_quit_pressed():
	get_tree().quit()

func _on_about_pressed():
	$main.hide()
	$about.show()

func _on_back_pressed():
	$about.hide()
	$credits.hide()
	$decompcredits.hide()
	$main.show()

func _button_hover():
	$hover.play()
func _button_press():
	$click.play()

func _on_credits_pressed():
	$main.hide()
	$credits.show()

func _on_decompcredits_pressed():
	$main.hide()
	$decompcredits.show()

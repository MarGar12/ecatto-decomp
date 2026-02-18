extends CharacterBody2D

# THE SCARY FUCKING SKELETON
#            __________________
#         /                      \
#        /                        \
#       /                          \
#      |      __            __      |
#      |    /     \      /     \    |
#       \   \     /  __  \     /   /
#        \          /  \          /
#         \                      /
#          |   |   |    |   |   |
#          |   |   |    |   |   |

class_name element_catto

var player_spawned = false

var elements = ["Muonium","Hydrogen","Helium","Lithium","Beryllium","Boron","Carbon","Nitrogen","Oxygen","Fluorine","Neon","Sodium","Magnesium","Aluminium","Silicon","Phosphorus","Sulfur","Chlorine","Argon","Potassium","Calcium","Scandium","Titanium","Vanadium","Chromium","Manganese","Iron","Cobalt","Nickel","Copper","Zinc","Gallium","Germanium","Arsenic","Selenium","Bromine","Krypton","Rubidium","Strontium","Yttrium","Zirconium","Niobium","Molybdenum","Technetium","Ruthenium","Rhodium","Palladium","Silver","Cadmium","Indium","Tin","Antimony","Tellurium","Iodine","Xenon","Caesium","Barium","Lanthanum","Cerium","Praseodymium","Neodymium","Promethium","Samarium","Europium","Gadolinium","Terbium","Dysprosium","Holmium","Erbium","Thulium","Ytterbium","Lutetium","Hafnium","Tantalum","Tungsten","Rhenium","Osmium","Iridium","Platinum","Gold","Mercury","Thallium","Lead","Bismuth","Polonium","Astatine","Radon","Francium","Radium","Actinium","Thorium","Protactinium","Uranium","Neptunium","Plutonium","Americium","Curium","Berkelium","Californium","Einsteinium","Fermium","Mendelevium","Nobelium","Lawrencium","Rutherfordium","Dubnium","Seaborgium","Bohrium","Hassium","Meitnerium","Darmstadtium","Roentgenium","Copernicium","Nihonium","Flerovium","Moscovium","Livermorium","Tennessine","Oganesson","Ununennium","Unbinilium"]
var symbols = ["Mu","H","He","Li","Be","B","C","N","O","F","Ne","Na","Mg","Al","Si","P","S","Cl","Ar","K","Ca","Sc","Ti","V","Cr","Mn","Fe","Co","Ni","Cu","Zn","Ga","Ge","As","Se","Br","Kr","Rb","Sr","Y","Zr","Nb","Mo","Tc","Ru","Rh","Pd","Ag","Cd","In","Sn","Sb","Te","I","Xe","Cs","Ba","La","Ce","Pr","Nd","Pm","Sm","Eu","Gd","Tb","Dy","Ho","Er","Tm","Yb","Lu","Hf","Ta","W","Re","Os","Ir","Pt","Au","Hg","Tl","Pb","Bi","Po","At","Rn","Fr","Ra","Ac","Th","Pa","U","Np","Pu","Am","Cm","Bk","Cf","Es","Fm","Md","No","Lr","Rf","Db","Sg","Bh","Hs","Mt","Ds","Rg","Cn","Nh","Fl","Mc","Lv","Ts","Og","Uue","Ubn"]
var mt = [10,14,-5,454,1560,2349,3915,63.2,54.4,53.5,24.6,371,923,933.5,1687,317,388,172,83.8,337,1115,1814,1941,2183,2180,1519,1811,1768,1728,1358,693,303,1211,887,494,265.8,116,312.5,1050,1799,2125,2750,2896,2430,2607,2237,1828,1235,594,430,505,904,723,387,161.5,301.7,1000,1193,1068,1204,1295,1315,1345,1099,1585,1629,1680,1734,1802,1818,1097,1925,2506,3290,3695,3459,3306,2719,2041,1337,234.3,577,601,545,527,500,202,300,973,1500,2023,1841,1405,912,912.5,1449,1613,1259,1173,1133,1800,1100,1100,1900,2400,2000,2000,2000,2000,2000,2000,2000,283,700,284,670,700,700,325,288,953]
var bt = [20,20.2,4.2,1617,2742,4200,3915,77.4,90.2,85,27.1,1156,1363,2743,3538,554,718,239,87.3,1031,1757,3109,3560,3680,2944,2334,3134,3200,3003,2835,1180,2676,3106,887,958,332,120,961,1650,3203,4650,5017,4912,4538,4423,3968,3236,2435,1040,2345,2875,1908,1261,457.5,165,944,2118,3737,3716,3403,3347,3273,2173,1802,3546,3396,2840,2873,3141,2223,1469,3675,4876,5731,6203,5903,5281,4403,4098,3243,630,1746,2022,1837,1235,1000,211.5,950,2010,3500,5061,4300,4404,4447,3505,2880,3383,2900,1743,1269,2000,2000,2000,3000,5800,5000,5000,5000,5000,5000,5000,5000,340,1430,350,1400,1100,883,450,903,1973]
var densities = [0.1,0.09,0.18,530,1845,2300,2000,1.25,1.43,1.7,0.9,970,1737,2700,2330,1823,2070,3.2,1.78,860,1526,2990,4502,6100,7192,7476,7874,8834,8907,8935,7140,5907,5327,5782,4810,3103,3.75,1534,2582,4470,6505,8582,10223,11400,12364,12423,12007,10503,8650,7290,7000,6694,6237,4944,5.9,1886,3594,6145,6700,6773,7007,7200,7518,5246,7899,8229,8550,8795,9065,9320,6967,9840,13281,16678,19254,21010,22587,22562,21452,19283,13546,11873,11348,9807,9200,8930,9.73,2460,5500,10000,11725,15430,19050,20480,19850,12000,13510,13250,15100,8840,9700,10300,9900,14400,17000,21600,23500,26500,28000,27500,26500,23000,14000,16000,11400,13500,12900,7200,7200,3000,7000]
var main_isotopes = [0,1,4,7,9,11,12,14,16,19,20,23,24,27,28,31,32,35,40,39,40,45,48,51,52,55,56,59,58,63,64,69,74,75,80,79,84,85,88,89,90,93,98,99,102,103,106,107,114,115,120,121,130,127,132,133,138,139,140,141,142,147,152,153,158,159,164,165,166,169,174,175,180,181,184,187,192,193,195,197,202,205,208,209,210,219,222,223,226,227,232,231,238,237,244,241,247,247,251,252,257,258,259,266,267,268,269,270,271,278,281,282,285,286,289,290,293,294,294,295,295]
var type = "nonmetal"
var group = "hydrogen"
var atoms = 2
var protons = 1
var electrons = 1
var neutrons = 0
var antimuons = 0
var charge = 0
var mass = 1
var density = 0.09
var boiltemp = 20.2
var melttemp = 14.0
var halflife = INF
var gender = 0
var credit = ""
var note = ""

var max_electrons = 2

var state = "gas"
var valence = 1
var cloud = false

var eye1 = 0
var eye2 = 0
var mouth = 0
var spot = 0
var pupil1 = 0
var pupil2 = 0
var glasses = 0

var rad_color = [0.25,0.5,1]

var onfire = false

var dragged = false
var noise = 0
var noisetimer = 0.0

var look_x = 0.0
var look_y = 0.0
var looktimer = 5.0
var movetimer = 10.0
var nearby = null
var interest = null
var disinterest = null
var attractor = null
var attr_force = 1.0

var expression = "normal"
var knocked_out = 0.0

var id = randf_range(0,1000)

var decay = INF
var nuclidemap_value = 0.0
var decaymap_value = 0.0

var eu_glassesdown = false
var rad_level = 0.1

var date = [Time.get_datetime_dict_from_system().month,Time.get_datetime_dict_from_system().day]

var proc = FastNoiseLite.new() #for procedural synthetic elements later down the line
var petted = false
var pet_thresh:int = 0
var pet_num:int = 0


func _ready():
	glob.cattos += 1
	movetimer = randf_range(0,10)
	if protons < 119 and player_spawned == true: neutrons = main_isotopes[protons]-protons
	if protons == 0: antimuons = 1
	flash()
	
	if protons == 110:
		pass
		#var https:HTTPRequest = HTTPRequest.new()
		#add_child(https)
		#https.request("https://wttr.in/Darmstadt?format=%t")
		#$HTTPRequest.request("https://wttr.in/Darmstadt?format=%t") to implement Darmstadtiums temp

	match protons:
		3: pet_thresh = 15
		11, 19: pet_thresh = 2
		27: pet_thresh = 8
		37, 55: pet_thresh = protons
		87: pet_thresh = 5
		

func _process(delta: float) -> void:
	#if glob.cattos <= -1:
	#	glob.cattos = 0
	#if glob.particles <= -1:
	#	glob.particles = 0
	
	$info/electrons.text = str(int(electrons)) + "e"
	$info/type.text = group + " (" + state + ")"
	$info/density.text = "density: " + str(snapped(density,0.01)) + " kg/m^3"
	
	$info/halflife.visible = glob.weakforce
	
	#lag prevention
	#if protons < 0 or delta > 0.5:
	#	print("  " + $info/name.text)
	#	glob.cattos -= 1
	#	queue_free()
	$gas.visible = delta < 0.1 and electrons > 0
	$drip.visible = delta < 0.1 and electrons > 0
	
	#fire color based on element
	if protons == 9:
		$model/fire.color = Color(0.35, 0.41, 0.0, 1.0)
	elif protons == 17:
		$model/fire.color = Color(0.198, 0.426, 0.0, 1.0)
	elif protons == 35:
		$model/fire.color = Color(1.0, 0.192, 0.0, 1.0)
	elif protons == 53:
		$model/fire.color = Color(0.608, 0.102, 0.486, 1.0)
	elif protons == 85:
		$model/fire.color = Color(0.361, 0.122, 0.353, 1.0)
	else:
		#$model/fire.color = Color(1, 0.37, 0, 1)
		if protons == 55:
			$model/fire.color = $model/body.sprite_frames.get_frame_texture("default",protons).get_image().get_pixel(64,110)
		elif protons >= 0:
			$model/fire.color = $model/body.sprite_frames.get_frame_texture($model/body.animation,$model/body.frame).get_image().get_pixel(64,84)
		
	if glob.cattos > 30 and $model/face/anim.is_playing(): $model/face/anim.stop()
	elif !$model/face/anim.is_playing(): $model/face/anim.play()
	
	$range.monitoring = glob.cattos < 100
	
	#extra effects
	$model/face/eye1/sonar.visible = protons == 65
	$model/effects/orbit.visible = protons in [107,112]
	$model/effects/rf_electrons.visible = protons == 104
	$model/effects/bh_electrons.visible = protons == 107
	$model/effects/rg_electrons.visible = protons == 111
	$model/effects/rg_nucleus.visible = protons == 111
	$model/effects/au_electrons.visible = [protons,mass] == [79,199]
	$model/effects/au_nucleus.visible = [protons,mass] == [79,199]
	$model/effects/au_nucleus.scale = $model/effects/rg_nucleus.scale
	if protons == 112 and mass == 277:
		$model/effects/cn_earth.visible = 0
		$model/effects/orbit.modulate = Color(0.0, 0.0, 0.0, 1.0)
	elif protons == 112 and mass == 288:
		$model/effects/cn_earth.visible = 0
		$model/effects/orbit.visible = 0
	else:
		$model/effects/cn_earth.visible = protons == 112
		$model/effects/orbit.modulate = Color(0.5, 0.5, 0.5, 1.0)
	
	if protons == 112: 
		$model/effects/orbit.scale.y = 0.25
	else:
		$model/effects/orbit.scale.y = 1
	if decay != INF:
		$model/effects/cn_earth.position.x = -sin(decay*2)*32
		$model/effects/cn_earth.position.y = 8 + cos(decay*2)*8
	$model/effects/cn_earth.z_index = sign($model/effects/cn_earth.position.y-8)
	#delete when resetting
	if Input.is_action_just_pressed("R"):
		queue_free()

func _physics_process(delta: float) -> void:
	#print(delta)
	#funny astatine thing
	if protons == 85 and glob.camera.zoom.x < 4.0 and Time.get_time_dict_from_system().hour < 6:
		if abs(global_position.x-glob.camera.global_position.x) > get_window().size.x/glob.camera.zoom.x:
			destroy("poof")
	
	#pride month
	$transgrad.rotate(delta*0.5)
	if date[0] == 6:
		$radiation.modulate.h += delta*0.25
	elif date == [3,31]:
		$radiation.modulate = $transgrad.texture.get_image().get_pixel(1,abs(sin($transgrad.rotation))*110.0)
	
	#out of bounds
	#if abs(position.x) > 2500: position.x = 2500*sign(position.x)
	if position.y < -2048: position.y = -2048
	
	#states of matter
	if glob.temperature > boiltemp: 
		state = "gas"
	elif glob.temperature > melttemp:
		state = "liquid"
		$drip.gravity.y = glob.gravity*10
	else: 
		state = "solid"
	$gas.emitting = state == "gas"
	$drip.emitting = state == "liquid"
	$heat.advance((glob.temperature-293.15)/1000.0-$heat.current_animation_position)
	if glob.temperature > 2000+boiltemp and protons-electrons < glob.temperature/boiltemp and electrons > 0:
		electrons -= 1
		emit("electron")
	if state == "liquid" and protons != 114: $model/face/eye1.position.y /= 1+delta*2
	else: $model/face/eye1.position.y += (-4-$model/face/eye1.position.y)*delta*2
	$model/face/pupils/pupil1.position.y = $model/face/eye1.position.y+4
	
	#element properties
	if group == "noble gas": atoms = 1
	else: atoms = 2
	
	if protons < 121:
		if state == "gas": #gases follow the ideal gas law
			if protons == 0: density = pow(10,-6)+(glob.pressure*10000*0.114*atoms/1000.0)/(8.314*glob.temperature)*10
			else: density = pow(10,-6)+(glob.pressure*10000*mass*1.068*atoms/1000.0)/(8.314*glob.temperature)*10
		else: density = (densities[protons]*mass/main_isotopes[protons]) / pow(glob.temperature/293.15,0.1)
		melttemp = mt[protons]
		if glob.pressure == 0: boiltemp = melttemp
		else: boiltemp = bt[protons]
	else:
		@warning_ignore("integer_division")
		density = 1000*mass/(protons*2) / pow(glob.temperature/293.15,0.1)
		melttemp = 1500
		boiltemp = 3000
	
	#ions & nuclei
	charge = protons-electrons
	$model.visible = electrons > 0 and cloud == false
	$nucleus.visible = electrons == 0 and cloud == false
	$col_body.disabled = electrons == 0 and cloud == false
	$model/face/charge.visible = charge != 0 and protons > 0
	$model/face/charge/v.visible = charge > 0 and protons > 0
	$model/face/charge.modulate.v = $model/face/mouth.self_modulate.v
	$nucleus/face.visible = protons > 0 and protons != 71
	$nucleus/clock.visible = protons == 71
	$nucleus/clock/h.rotation = Time.get_time_dict_from_system().hour*PI/6.0
	$nucleus/clock/m.rotation = Time.get_time_dict_from_system().minute*PI/30.0
	$nucleus/clock/s.rotation = Time.get_time_dict_from_system().second*PI/30.0
	$nucleus/body/glow.visible = antimuons > 0
	
	#radioactive decay
	if protons > 0 and antimuons > 0 and glob.weakforce == true:
		emit("positron")
		emit("neutrino")
		flash()
		antimuons -= 1
	$model/face/eye_mu.visible = antimuons > 0
	
	if halflife == INF or glob.weakforce == false: 
		$radiation.emitting = false
	else: 
		if decay == INF: decay = tan(deg_to_rad(randf_range(0,90)))*halflife
		if $geiger.playing == false: $geiger.play(randf_range(0,0.2))
		$geiger.pitch_scale = clamp(1.5 + 1/decay,1.5,3)
		$radiation.emitting = true
		decay -= delta * glob.rate
		if decay <= 0: 
			if protons == 0: 
				if neutrons == 0:
					emit("positron")
					for e in electrons: emit("electron")
					emit("neutrino")
					destroy("explosion")
				else:
					decay_into(2,false)
			else:
				if [protons,mass] == [1,3]: decay_into(2,false)
				elif protons == 1: decay_into(5,true)
				elif [protons,mass] == [2,2]: decay_into(7,true)
				elif [protons,mass] == [4,8]: decay_into(1,true)
				elif [protons,mass] == [43,99]: decay_into(2,false)
				elif [protons,mass] == [60,147]: decay_into(2,false)
				elif [protons,mass] == [85,215]: decay_into(1,true)
				elif protons > 100 and neutrons > 140: decay_into([1,1,1,4].pick_random(),true)
				elif protons > 82: decay_into(1,false)
				elif mass > main_isotopes[protons]: 
					if nuclidemap_value == 0: decay_into(5,false)
					else: decay_into(2,false)
				elif mass < main_isotopes[protons]: 
					if nuclidemap_value == 0: decay_into(7,false)
					else: decay_into(3,false)
				else: decay_into(1,true)
		$radiation.modulate.a = clamp(10.0/sqrt(halflife),0,10)
	
	#electron capacity
	if protons in range(0,3): 
		max_electrons = 2
	elif protons in range(3,11): 
		max_electrons = 10
	elif protons in range(11,19): 
		max_electrons = 18
	elif protons in range(19,37): 
		max_electrons = 36
	elif protons in range(37,55): 
		max_electrons = 54
	elif protons in range(55,87): 
		max_electrons = 86
	elif protons in range(87,119): 
		max_electrons = 118
	else: 
		@warning_ignore("integer_division")
		max_electrons = 140 + (32*floor((protons-140)/32)) + 32
	if electrons > max_electrons:
		electrons -= 1
		emit("electron")
	
	#valence
	if group == "alkali metal" or protons in [0,1,9]: valence = 1
	elif group == "alkaline earth metal" or protons in [8,30,36,48,80,112]: valence = 2
	elif group == "triel" or protons in [21,39,47,57,61,62,63,64,67,68,69,70,71,89,100,101,102,103]: valence = 3
	elif group == "tetrel" or protons in [22,28,29,40,58,60,65,66,72,90,99,104]: valence = 4
	elif group == "pnictogen" or protons in [27,46,59,73,79,91,97,98,105]: valence = 5
	elif group == "chalcogen" or protons in [24,42,74,78,86,92,96,106]: valence = 6
	elif group == "halogen" or protons in [25,26,43,45,75,93,95,107]: valence = 7
	elif protons in [44,54,76,94,108]: valence = 8
	elif protons == 77: valence = 9
	else: valence = 0
	
	# fire color
	#if protons == 17:
		#$model/fir
	
	#becoming quark-gluon plasma
	if glob.t_power > 5:
		if protons > (9-glob.t_power)**2+1: 
			protons -= 1
			neutrons -= 1
			$spawn.play()
			flash()
	if glob.t_power >= 9.5: destroy("quark_gluon_plasma")
	
	#text display
	$model/face/facetext.visible = protons in [71,110]
	if protons == 71: 
		$model/face/facetext.modulate = Color8(0,255,0)
		if knocked_out > 1.0: $model/face/facetext.text = str(randf_range(10000,99999))
		else: $model/face/facetext.text = str(Time.get_time_string_from_system())
		$model/face/facetext.visible_characters = 5
		
		if petted:
			$model/face/facetext.text = ":3"
			$model/face/facetext.visible_characters = -1
	if protons == 110: 
		$model/face/facetext.modulate = Color8(255,160,0)
		if knocked_out > 0: $model/face/facetext.text = "!?!?!"
		elif decay < 1: $model/face/facetext.text = "BYE :3"
		#elif glob.tool == 8 and Input.is_action_pressed("lmb") and glob.selected == self:
		#	$model/face/facetext.text = ">   <"
		elif position.y < -500: $model/face/facetext.text = "AAAAH"
		elif dragged == true: $model/face/facetext.text = "HAI :3"
		elif velocity.y < 0: $model/face/facetext.text = "HUP!"
		elif nearby == null:
			if looktimer > 2: $model/face/facetext.text = str(snapped(glob.temperature-273.15,0.01)) + "°C"
			else: $model/face/facetext.text = "ZÜGE"
			
		if petted:
			$model/face/facetext.text = "<3"
	
	#info
	$model/select.visible = glob.selected == self
	$info.visible = $model/select.visible
	$info.rotation = -rotation
	
	if halflife == INF or decay == INF: $info/halflife.text = "stable"
	else: 
		var unit = ""
		if decay > 86400*365.25: unit = str(snapped(decay/365.25/86400,0.1)) + "y"
		elif decay > 86400: unit = str(snapped(decay/86400.0,0.1)) + "d"
		elif decay > 3600: unit = str(snapped(decay/3600.0,0.1)) + "h"
		elif decay > 60: unit = str(snapped(decay/60.0,0.1)) + "min"
		elif decay > 1: unit = str(snapped(decay,0.1)) + "s"
		elif decay > 0.001: unit = str(floor(decay*1000)) + "ms"
		elif decay > pow(10,-6): unit = str(floor(decay*pow(10,6))) + "μs"
		elif decay > pow(10,-9): unit = str(floor(decay*pow(10,9))) + "ns"
		elif decay > pow(10,-12): unit = str(floor(decay*pow(10,12))) + "ps"
		$info/halflife.text = "decays in " + unit
	
	#gravity
	if electrons > 0: 
		if !is_on_floor(): velocity.y += glob.gravity*100 * delta * glob.rate
		if density < 1.3 and state == "gas": velocity.y -= (glob.air_density/density)*glob.pressure*glob.gravity*100 * delta * glob.rate
	elif !is_on_floor(): velocity.y += glob.gravity*100*delta * glob.rate
	velocity.y = clamp(velocity.y,-1000,5000)
	if is_on_floor() or is_on_ceiling():
		velocity.x /= 1+delta*10
	
	#rotation
	if glob.catto_rotat == true:
		if state == "solid" and glob.temperature <= melttemp-200 and dragged == true: 
			rotation_degrees += velocity.x*0.5*delta
			rotation /= 1+delta*glob.gravity
		elif knocked_out <= 0 and (abs(rotation_degrees) < 30 or velocity.y < 0): rotation /= 1+delta*3*glob.gravity
		elif abs(rotation_degrees) < 120: rotation_degrees += (sign(rotation)*60-rotation_degrees)*delta*3*glob.gravity
		else: rotation_degrees += (sign(rotation)*180-rotation_degrees)*delta*3*glob.gravity
		if glob.gravity < 0.5: rotation_degrees += velocity.x*0.5*delta
	elif dragged == true:
		if Input.is_action_pressed("Q"): rotation -= delta
		if Input.is_action_pressed("E"): rotation += delta
	
	move_and_slide()
	
	#dragging the catto
	if glob.selected == self and Input.is_action_pressed("lmb"):
		if glob.tool == 8: # thanks flamebium <3
			dragged = false
		else:
			dragged = true
		glob.dragging = true
		$model/anim.play("grabbed")
	if Input.is_action_just_released("lmb"):
		dragged = false
		glob.dragging = false
		$model/anim.play("idle")
	
	if dragged == true and Input.is_action_pressed("lmb"):
		velocity = (get_global_mouse_position() - position) * 5
	
	var speed = clamp(sqrt(glob.temperature/293.15),0,5) * glob.rate
	
	#looking around
	if knocked_out <= 0:
		if group == "noble gas" or protons == 22 or $model/face/eye1.animation == "shut" or $model/face/eye1.animation == "happy": 
			$model/face/anim.play("RESET")
		else:
				$model/face/anim.play("blink")
		looktimer -= delta * speed
		if interest == null and disinterest == null:
			if looktimer <= 0:
				if cloud == true:
					position.y -= 64
					poof()
					cloud = false
				look_x = randf_range(-8,8)
				look_y = randf_range(-8,4)
				looktimer = randf_range(1,7)
				$model/face/anim.speed_scale = randf_range(0.5,1.5)
			if (get_global_mouse_position()-position).length() < 100 and group != "noble gas":
				look_x = (get_global_mouse_position().x-position.x)/8.0
				look_y = (get_global_mouse_position().y-position.y)/16.0
		elif interest != null:
			look_x = clamp(interest.position.x-position.x,-8,8)
			look_y = clamp(interest.position.y-position.y,-8,4)
		elif disinterest != null:
			look_x = -clamp(disinterest.global_position.x-global_position.x,-8,8)
			look_y = -clamp(disinterest.global_position.y-global_position.y,-8,4)
		$model/face.position.x = move_toward($model/face.position.x,look_x,abs(look_x-$model/face.position.x)*delta*10*glob.temperature/273.15)
		if protons == 114: $model/face.position.y = look_y+30
		else: $model/face.position.y = move_toward($model/face.position.y,look_y+24,abs(look_y+24-$model/face.position.y)*delta*10*glob.temperature/273.15)
		$model/face/spot.position.x = -$model/face.position.x/2.0
		$model/face/spot.position.y = -$model/face.position.y/2.0+8
		$nucleus/face.position.x = $model/face.position.x/2.0
		$nucleus/face.position.y = ($model/face.position.y-24)/2.0
		$model/face/pupils.position.x = look_x/3.0
		$model/face/pupils.position.y = look_y/6.0-4
	else:
		$model/face/anim.play("RESET")
	
	#facial expressions
	if knocked_out > 0: knocked_out -= delta
	if knocked_out < 0: 
		update()
		knocked_out = 0
	if knocked_out > 1.0: $model/face/eye1.play("shut")
	else:
		if interest != null:
			if interest is element_catto:
				if protons == 8 and interest.protons == 26: eye1 = 11
				if protons == 11 and interest.protons == 17: eye1 = 20
		if disinterest != null: 
			if disinterest is element_catto:
				if protons == 27 and disinterest.protons == 60: eye1 = 2
				if protons == 33 and mass == 75:
					if disinterest.protons == 33 and disinterest.mass != 75: eye1 = 11
					if disinterest.protons == 30: eye1 = 2
		if protons in [38,65,67,73,103,107,108]:
			if protons == 38: 
				if mass == 90: eye2 = 18
				else: eye2 = 12
			elif protons == 73: eye2 = 29
			elif protons == 107: eye2 = 52
			else: eye2 = 0
		elif !([protons,mass] in [[22,44],[26,57],[87,212]]): eye2 = eye1
	if protons == 87 and mass == 212 and electrons != 0:
		$model/face/eye1.offset.y = -18
		$model/face/eye2.offset.y = -18
		$model/face/mouth.offset.y = -14
		#$model/face/mouth.offset.x = -1
	elif protons == 56 and mass == 154 and electrons != 0:
		$model/face/eye1.offset.y = -16
		$model/face/eye2.offset.y = -16
		$model/face/mouth.offset.y = -12
		#$model/face/mouth.offset.x = -1
	else:
		$model/face/eye1.offset.y = 0
		$model/face/eye2.offset.y = 0
		$model/face/mouth.offset.y = 0
		#$model/face/mouth.offset.x = 0
	if !protons in [3,8,33,101]:
		$nucleus/face/eye1.frame = eye1
		$nucleus/face/eye2.frame = eye2
	$model/face/eye1.frame = eye1
	$model/face/eye2.frame = eye2
	if $model/face/eye1.animation in ["happy","shut"]:
		$model/face/eye2.animation = $model/face/eye1.animation
		if protons in [6,34,35,63,64,75,85,86,97,109,111,118]: $model/face/eye1.frame = 1
		elif protons == 117 and mass == 292: $model/face/eye1.frame = 1
		else: $model/face/eye1.frame = 0
		if protons == 63: $model/face/eye1.modulate = Color8(255,0,0)
		elif protons == 64: $model/face/eye1.modulate = Color8(128,128,128)
		elif protons == 111: $model/face/eye1.modulate = Color8(128,200,255)
		else: $model/face/eye1.modulate = Color8(255,255,255)
		$model/face/eye2.frame = $model/face/eye1.frame
		$model/face/eye2.modulate = $model/face/eye1.modulate
		$model/face/eye3.modulate = $model/face/eye1.modulate
		$model/face/eye4.modulate = $model/face/eye1.modulate
	if protons == 77: $model/face/eye3.frame = 57
	elif protons == 98: $model/face/eye3.frame = 56
	elif protons == 114: $model/face/eye3.frame = 39
	else: $model/face/eye3.frame = eye1
	$model/face/pupils/pupil1.frame = pupil1
	$model/face/pupils/pupil2.frame = pupil2
	$model/face/pupils/pupil3.frame = pupil1
	
	if interest == null and disinterest == null:
		if !petted:
			if group == "noble gas" or protons in [15,27,38]: mouth = 1
			elif [protons,mass] in [[33,72],[42,95]]: mouth = 1
			elif protons in [3,33,55,87,96,102,106] or [protons,mass] == [79,195]: mouth = 2
			elif protons == 42 and mass != 92: mouth = 2
			elif protons == 60 and mass == 163: mouth = 2
			elif [protons,mass] != [6,14]: mouth = 0
	elif interest != null: mouth = 0
	elif disinterest != null: mouth = 2
	$model/face/mouth.frame = mouth
	
	#fangs
	$model/face/mouth/fangs.visible = (group == "halogen" or protons == 117) and $model/face/mouth.frame == 0
	$model/body/ca_fangs.visible = protons == 20
	if [protons,mass] == [20,47]: $model/body/ca_fangs.frame = 1
	elif [protons,mass] == [20,48]: $model/body/ca_fangs.frame = 2
	elif [protons,mass] == [20,52]: $model/body/ca_fangs.frame = 3
	else: $model/body/ca_fangs.frame = 0
	$model/body/ca_fangs.position.x = $model/face.position.x*0.7
	
	$model/face/eye1/bolt.visible = [protons,mass] in [[7,13],[8,15]]
	$model/face/eye2/bolt.visible = $model/face/eye1/bolt.visible
	if mass == 13: $model/face/eye1/bolt.frame = 0
	if mass == 15: 
		$model/face/eye1/bolt.frame = 1
		$model/face/eye2/bolt.flip_h = false
	else: $model/face/eye2/bolt.flip_h = true
	$model/face/eye2/bolt.frame = $model/face/eye1/bolt.frame
	
	#adding radioactivity scars & removing eyelashes
	if protons in [2,3,5,6,11,13,14,15,21,23,26,27,28,30,31,32,33,34,39,42,49,50,52,55,56,57,62,69,74,75,76,81]: gender = 1
	elif protons in [18,20,25,35,37,40,41,45,53,54,60,63,64,68,70,72,80,83]: gender = 2
	else: gender = 0
	if protons < 120 and mass != main_isotopes[protons] and $model/body.animation == "default":
		if gender == 0 and !(protons in [43,49,52,61,75] or protons > 82) and halflife != INF: 
			$model/body/scars.visible = true
			if !(protons in [8,10,22,36,38,47,48,59,65,67,71,73,77,78]):
				$model/face/eye1.frame = 0
				$model/face/eye2.frame = 0
		else: $model/body/scars.visible = false
	else: $model/body/scars.visible = false
	
	#movement
	if group != "noble gas" and glob.catto_ai == true and knocked_out <= 0:
		if interest != null or disinterest != null: movetimer -= delta * 5 * speed
		else: movetimer -= delta * speed
		if movetimer <= 0:
			if state == "gas" or electrons != protons:
				velocity = Vector2(look_x,look_y)*20 * speed
			elif is_on_floor():
				velocity.x = look_x*20 * speed
				velocity.y -= 500 * glob.rate
			movetimer = randf_range(1,10)
	if attractor != null:
		if attractor is element_catto: attr_force = -(charge*attractor.charge)*0.01
		else: attr_force = 1.0
		velocity.x -= cos((position-attractor.position).angle()) * 20000/position.distance_squared_to(attractor.position) * attr_force * glob.rate
		velocity.y -= sin((position-attractor.position).angle()) * 20000/position.distance_squared_to(attractor.position) * attr_force * glob.rate
	
	#tail direction
	if dragged == false: $model/tail.offset.x = -32 * sign(velocity.x+10)
	else: $model/tail.offset.x = -32
	$model/tail.flip_h = $model/tail.offset.x > 0
	
	#squishy fluid
	if glob.temperature > melttemp-200 and !is_on_ceiling() and cloud == false:
		scale.y = move_toward(scale.y,1+velocity.y/2000.0,scale.y*delta*10)
		scale.x = 2-scale.y
		$model.skew = clamp(-velocity.x/2000.0,-1,1) * sign(velocity.y)
	else: 
		scale += (Vector2.ONE-scale)*delta*10
		$model.skew /= 1+delta*5
	scale.x = clamp(scale.x,0.5,2)
	scale.y = clamp(scale.y,0.25,2)
	
	#cloud
	if cloud == true: 
		$col_head.disabled = true
		$col_body.disabled = true
		if state != "gas": cloud = false
		
		collision_mask = 2
		$col_cloud.disabled = false
	else: 
		$col_head.disabled = false
		collision_mask = 1
		$col_cloud.disabled = true
	collision_layer = collision_mask
	$cloud.emitting = cloud
	$cloud.color = $gas.color
	$cloud/face.visible = cloud
	$cloud/face.position = $nucleus/face.position
	$cloud/face/eye1.animation = $model/face/eye1.animation
	$cloud/face/eye2.animation = $model/face/eye2.animation
	$cloud/face/eye3.animation = $model/face/eye3.animation
	$cloud/face/eye1.frame = $model/face/eye1.frame
	$cloud/face/eye2.frame = $model/face/eye2.frame
	$cloud/face/eye3.frame = $model/face/eye3.frame
	$cloud/face.modulate = $model/face/eye1.self_modulate
	$cloud/face/eye1.visible = protons > 0
	$cloud/face/eye2.visible = protons > 0
	$cloud/face/eye3.visible = protons in [77,98,114]
	$cloud/face/eye_mu.visible = protons == 0 and antimuons > 0
	
	#being on fire
	$model/fire.emitting = onfire
	
	#sounds
	if abs(velocity.y) > 50:
		noise = 1
	if abs(velocity.y) > 250:
		noise = randi_range(2,4)
	if abs(velocity.y) > 1000:
		noise = randi_range(5,7)
	if (is_on_floor() or is_on_ceiling()) and noise > 0 and noisetimer <= 0:
		if state == "solid":
			if type in ["metal","metalloid"]: get_node("clank"+str(noise)).play()
			else: 
				$clank1.pitch_scale = 1.5+abs(velocity.y)/500.0
				$clank1.play(0.05)
		if state == "liquid":
			$splash.pitch_scale = clamp(abs(velocity.y)/100.0,0.5,4)
			$splash.play(0.05)
		if state == "gas": 
			if glob.poof == true and noise >= 3:
				poof()
				cloud = true
				looktimer = randf_range(1,10)
			$poof.play(0.05)
		noise = 0
		noisetimer = randf_range(0,0.5)
	if noisetimer > 0: noisetimer -= delta
	
	#cool things they do when they absorb a photon (this part of the code removes those things if the element changes)
	if protons != 21 and $model/sc_glow.visible == true: $model/sc_glow.hide()
	if protons != 58 and $model/ce_flame.emitting == true: $model/ce_flame.emitting = false
	if protons != 63 and $model/face/glasses.position.y != 0: $model/face/glasses.position.y = 0
	if protons != 66 and $model/tail/dy_laser.visible == true: $model/tail/dy_laser.hide()
	if protons != 88 and mass == 223 and $model/ra223_glow.visible == true: 
		$model/ra223_glow.hide()
		$model/ra_glow.hide()
	if protons != 88 and $model/ra_glow.visible == true:
		$model/ra_glow.hide()
		$model/ra223_glow.hide()
	if protons == 88 and mass != 223 and $model/ra223_glow.visible == true:
				$model/ra_glow.show()
				$model/ra223_glow.hide()
	if protons != 102 and $model/tail/no_fuse.emitting == true: $model/tail/no_fuse.emitting = false
	
	#dysprosium's dosimeter
	if nearby != null and nearby is element_catto: rad_level += ((0.1+pow(10,14)/nearby.halflife*randf_range(0.9,1.1))-rad_level)*delta*5
	else: rad_level += (0.1-rad_level)*delta*5
	
	$model/face/spot/dy_dosi.visible = protons == 66
	if rad_level < 1000: $model/face/spot/dy_dosi.text = str(snapped(rad_level,0.1)) + " μsv"
	elif rad_level < 1000000: $model/face/spot/dy_dosi.text = str(snapped(rad_level/1000.0,0.1)) + " msv"
	else: $model/face/spot/dy_dosi.text = str(snapped(rad_level/1000000.0,0.1)) + " sv"
	
	if petted:
		$model/face/spot/dy_dosi.text = ":3"
	
	#AI range thing
	if $range.scale < Vector2.ONE: $range.scale += Vector2.ONE*delta
	
	#using tools
	if glob.selected == self and Input.is_action_just_pressed("lmb"):
		if glob.tool == 1: 
			if protons > 2: decay_into(4,true)
			else: 
				for p in protons: spawn_catto(1,0,0,0)
				for n in neutrons: emit("neutron")
				for e in electrons: emit("electron")
				for m in antimuons: 
					emit("positron")
					emit("neutrino")
				destroy("explosion")
		if glob.tool == 2 and neutrons > 0:
			decay = INF
			neutrons -= 1
			emit("neutron")
			flash()
		if glob.tool == 3 and electrons > 0:
			electrons -= 1
			emit("electron")
			flash()
		if glob.tool == 6:
			spawn_catto(protons,neutrons,electrons,antimuons)
	if glob.selected == self and Input.is_action_pressed("lmb"):
		if glob.tool == 5:
			decay /= 1+delta*5
			$radiation.modulate.a = 1
			$geiger.base_vol = 0
			$geiger.pitch_scale = 2
		if glob.tool == 8 and Input.is_action_just_pressed("lmb"): # thanks flamebium <3
			if (get_global_mouse_position() - position).length() < 128:
				petted = true
				prints(pet_num, pet_thresh)
				if pet_num < pet_thresh:
					pet_num += 1
					
				if protons == 110:
					$model/face/facetext.text = "<3"
				if group == "alkali metal":
					if pet_num < pet_thresh:
						match protons:
							3: #lithium
								eye1 = 11
								eye2 = 11
							11, 19: #sodium, potassium
								mouth = 2
								eye1 = 20
								eye2 = 20
							37: # rubidium
								mouth = 2
						$hiss.play()
					else:
						$purr.play()
						$model/face/eye1.play("happy")
						if mouth != 0:
							mouth = 0
				else:
					$purr.play()
					if group != "noble gas":
						$model/face/eye1.play("happy")
						if mouth != 0:
							mouth = 0
						match protons:
							protons when protons in [25,85,94,101,109,114]:
								$model/face/pupils.visible = false
						if $model/face/eye3.visible:
							$model/face/eye3.play("happy")
						match protons:
							33: # arsenic
								$hiss.play()
								$model/face/eye1.play("shut")
								mouth = 2
							27: # cobalt
								print("ah")
								$purr.play()
								if pet_num < pet_thresh:
									print("ah")
									$model/face/eye1.play("shut")
									if mouth != 1: mouth = 1
								else:
									mouth = 0
							38: # strontium, only one eye closes
								$model/face/eye1.play("happy")
								$model/face/eye2.play("default")
							109: # meitnerium
								$model/face/eye1.visible = true
								$model/face/eye2.visible = true
					else: # catto is noble gassy
						if protons not in [2, 10]:
							mouth = 0
				$model/face/mouth.frame = mouth
		
	if glob.tool == 7 and Input.is_action_pressed("lmb"):
		velocity += (get_global_mouse_position()-position).normalized()/(get_global_mouse_position()-position).length()*delta*100000
		if (get_global_mouse_position()-position).length() < 64: destroy("poof")

func _on_mouse_entered():
	glob.selected = self
func _on_mouse_exited():
	glob.selected = null

func flash():
	if protons >= 0 and mass >= 0:
		calculate_mass()
		calculate_stability()
		update()
	$flash.modulate.a = 1
	$spawn.play()
	var tween: Tween = create_tween()
	tween.tween_property($flash, "modulate", Color(1,1,1,0), 0.25)

func destroy(eff):
	glob.cattos -= 1
	if Engine.get_frames_per_second() < 20: eff = "poof"
	var scene = load("res://ec_assets/objects/"+eff+".tscn")
	var instance = scene.instantiate()
	instance.position = position
	if instance.name == "poof": instance.color = $gas.color
	add_sibling.call_deferred(instance)
	queue_free()

func poof():
	velocity = Vector2.ZERO
	var scene = load("res://ec_assets/objects/poof.tscn")
	var instance = scene.instantiate()
	instance.position = position
	instance.color = $gas.color
	add_sibling.call_deferred(instance)

func generate_features():
	#reset face
	$model/face/eye1.play("default")
	$model/face/eye2.play("default")
	$model/face/eye3.play("default")
	$model/face/spot.play("default")
	$model/face/spot.modulate = Color8(255,255,255)
	$model/hair.play("default")
	
	#eyes
	if (group == "noble gas" or protons == 118) and !protons in [10,86]: eye1 = 1
	elif protons in [3,8]: eye1 = 2
	elif protons in [4,80]: eye1 = 3
	elif protons == 9: eye1 = 4
	elif protons == 10: eye1 = 59
	elif protons == 16: eye1 = 5
	elif protons == 17: eye1 = 6
	elif protons in [20,114]: eye1 = 7
	elif protons == 22: eye1 = 8
	elif protons == 23: eye1 = 9
	elif protons == 25: eye1 = 10
	elif protons in [33,37,56]: eye1 = 11
	elif protons == 40: eye1 = 13
	elif protons == 43: eye1 = 14
	elif protons == 44: eye1 = 15
	elif protons == 47: eye1 = 16
	elif protons == 48: eye1 = 17
	elif protons == 51: eye1 = 18
	elif protons == 52: eye1 = 19
	elif protons in [38,55,87,108]: eye1 = 20
	elif protons == 59: eye1 = 21
	elif protons == 60: eye1 = 22
	elif protons == 61: eye1 = 23
	elif protons == 63: eye1 = 24
	elif protons == 64: eye1 = 25
	elif protons == 65: eye1 = 26
	elif protons == 67: eye1 = 27
	elif protons == 68: eye1 = 28
	elif protons == 73: eye1 = 30
	elif protons == 74: eye1 = 31
	elif protons == 75: eye1 = 32
	elif protons == 76: eye1 = 33
	elif protons == 77: eye1 = 34
	elif protons == 78: eye1 = 35
	elif protons == 79: eye1 = 36
	elif protons == 82: eye1 = 37
	elif protons == 84: eye1 = 38
	elif protons == 85: eye1 = 39
	elif protons == 86: eye1 = 40
	elif protons == 91: eye1 = 41
	elif protons == 93: eye1 = 42
	elif protons in [94,111]: eye1 = 43
	elif protons == 96: eye1 = 44
	elif protons == 97: eye1 = 45
	elif protons == 98: eye1 = 46
	elif protons == 100: eye1 = 47
	elif protons == 101: eye1 = 48
	elif protons == 102: eye1 = 49
	elif protons == 103: eye1 = 50
	elif protons == 106: eye1 = 51
	elif protons == 113: eye1 = 53
	elif protons == 116: eye1 = 54
	elif protons == 120: eye1 = 55
	else: eye1 = 0
	if protons in [25,85,101,109,114]: 
		$model/face/pupils.visible = knocked_out <= 1.0
		if protons == 25: pupil1 = 0
		if protons in [85,114]: pupil1 = 1
		if protons == 109: pupil1 = 4
		if protons == 101:
			pupil1 = 2
			pupil2 = 3
		else: pupil2 = pupil1
	else: $model/face/pupils.visible = false
	$model/face/eye3.visible = protons in [77,98,114] or [protons,mass] == [2,3]
	$model/face/pupils/pupil3.visible = protons == 114
	$model/face/eye1.visible = (protons == 109 and knocked_out > 1.0) or !protons in [0,71,109,110]
	$model/face/eye2.visible = (protons == 109 and knocked_out > 1.0) or ($model/face/eye1.visible and !protons in [40,109])
	$model/face/mt_glasses.visible = protons == 109
	if antimuons > 0 and protons != 0 and $model/face/eye3.visible == false: $model/face/eye_mu.position.y = -14
	else: $model/face/eye_mu.position.y = -6
	$model/face/eye4.visible = [protons,mass] == [77,192]
	
	#mouths
	$model/face/mouth.visible = !(protons in [2,20,22,97,105,111,114,120] or [protons,mass] == [79,199] or knocked_out > 0)
	if protons == 10: $model/face/mouth.animation = "neon"
	elif protons == 63: $model/face/mouth.animation = "europium"
	else: $model/face/mouth.animation = "default"
	if protons == 63:
		$model/face/mouth.self_modulate = Color8(255,0,0)
	elif protons in [6,10,25,35,85,86,118,119]: 
		$model/face/mouth.self_modulate = Color8(255,255,255)
	elif protons == 64: 
		$model/face/mouth.self_modulate = Color8(192,192,192)
	else: 
		$model/face/mouth.self_modulate = Color8(0,0,0)
	if protons == 91: $model/face/mouth.self_modulate.b = 1
	
	#spots
	if protons in [14,17,22,23,26,27,29,30,42,47,54,66,70,75,78,81,88,94,113]: 
		if $model/ra_glow.visible == false and $model/ra223_glow.visible == false:
			$model/face/spot.visible = 1
		else:
			$model/face/spot.visible = 0
		if protons == 14: spot = 0
		if protons == 17: spot = 1
		if protons == 22: spot = 2
		if protons == 23: spot = 3
		if protons == 26: spot = 4
		if protons == 27: spot = 5
		if protons == 29: spot = 6
		if protons == 30: spot = 7
		if protons == 42: spot = 8
		if protons == 47: spot = 9
		if protons == 54: spot = 10
		if protons == 66: spot = 11
		if protons == 70: spot = 12
		if protons == 75: spot = 13
		if protons == 78: spot = 14
		if protons == 81: spot = 15
		if protons == 88: spot = 16
		if protons == 94: spot = 17
		if protons == 113: spot = 18
		if protons == 117: spot = 19
	else: $model/face/spot.visible = false
	if mass == 251:
		$model/face/es251_snout.visible = protons == 99
		$model/face/es_snout.visible = 0
	else:
		$model/face/es251_snout.visible = 0
		$model/face/es_snout.visible = protons == 99
	
	#tails
	if protons in [45,47,48,57,63,66,97,98,102]:
		$model/tail.visible = true
		$model/tail.play("default")
		if protons == 45: $model/tail.frame = 0
		if protons == 47: $model/tail.frame = 1
		if protons == 48: $model/tail.frame = 2
		if protons == 57: $model/tail.frame = 3
		if protons == 63: $model/tail.frame = 4
		if protons == 66: $model/tail.frame = 5
		if protons == 97: $model/tail.frame = 6
		if protons == 98: $model/tail.frame = 7
		if protons == 102: $model/tail.frame = 8
	elif [protons,mass] in [[1,4],[1,5],[10,22],[13,26],[20,47],[60,163],[76,189],[76,190],[77,192]]:
		$model/tail.visible = true
		$model/tail.play("isotopes")
		if mass == 4: $model/tail.frame = 0
		if mass == 5: $model/tail.frame = 1
		if mass == 22: $model/tail.frame = 8
		if mass == 26: $model/tail.frame = 2
		if mass == 47: $model/tail.frame = 3
		if mass == 163: $model/tail.frame = 7
		if mass == 189: $model/tail.frame = 5
		if mass == 190: $model/tail.frame = 6
		if mass == 192: $model/tail.frame = 4
	else:
		$model/tail.visible = false
	
	#glasses
	if protons in [2,14,63,69,71,101,103,110,114] and mass == main_isotopes[protons]:
		$model/face/glasses.visible = true
		if protons == 2: glasses = 0
		if protons == 14: glasses = 1
		if protons == 63: 
			glasses = 2
			if eu_glassesdown == false: $model/face/glasses.position.y = -18
		if protons == 69: glasses = 3
		if protons in [71,110]: glasses = 4
		if protons == 101: glasses = 5
		if protons == 103: glasses = 6
		if protons == 114: glasses = 7
	elif protons in [71,110]: 
		$model/face/glasses.visible = true
		glasses = 4
	else: $model/face/glasses.visible = false
	$model/face/glasses.frame = glasses
	
	#other accessories
	$model/db_rings.visible = protons == 105 and mass == main_isotopes[protons]
	
	#hair
	$model/hair.visible = (protons == 42 and mass in [92,95,100]) or protons in [76,83]
	if protons == 76: $model/hair.frame = 0
	if protons == 83: $model/hair.frame = 1

func update():
	#catto appearance
	if protons < $model/body.sprite_frames.get_frame_count("default"):
		$model/body.play("default")
		$model/body.frame = protons
	else: 
		$model/body.play("placeholder")
	
	if protons <= $nucleus/body.sprite_frames.get_frame_count("default")-1:
		$nucleus/body.play("default")
		$nucleus/body.frame = protons
	else:
		$nucleus/body.play("placeholder")
	
	#types
	if protons in [0,1,2,6,7,8,9,10,13,15,16,17,18,31,34,35,36,49,50,53,54,81,82,83,84,85,86]: type = "nonmetal"
	elif protons in [5,14,32,33,51,52]: type = "metalloid"
	else: type = "metal"
	
	#groups
	if protons in [3,11,19,37,55,87]: group = "alkali metal"
	elif protons in [4,12,20,38,56,88]: group = "alkaline earth metal"
	elif protons in range(57,72): group = "lanthanoid"
	elif protons in range(89,95): group = "actinoid"
	elif protons in [5,13,31,49,81]: group = "triel"
	elif protons in [6,14,32,50,82]: group = "tetrel"
	elif protons in [7,15,33,51,83]: group = "pnictogen"
	elif protons in [8,16,34,52,84]: group = "chalcogen"
	elif protons in [9,17,35,53,85]: group = "halogen"
	elif protons in [2,10,18,36,54,86]: group = "noble gas"
	elif protons == 1: group = "nonmetal"
	elif protons == 0: group = "exotic element"
	elif protons < 95: group = "transition metal"
	else: group = "synthetic element"
	if antimuons > 0: group = "exotic element"
	
	#radioactivity
	if protons <= 118 and mass == main_isotopes[protons]:
		if protons == 0: 
			if neutrons > 0: halflife = 900
			else: halflife = pow(10,-6)
		elif protons == 43: 
			halflife = 86400*365.25*211000
		elif protons == 49:
			halflife = 86400*365.25*4.41*pow(10,14)
		elif protons == 52:
			halflife = 86400*365.25*7.91*pow(10,20)
		elif protons == 61:
			halflife = 86400*365.25*2.6234
		elif protons == 75:
			halflife = 86400*365.25*4.16*pow(10,10)
		elif protons == 83: 
			halflife = 86400*365.25*2.01*pow(10,19)
		elif protons == 84: 
			halflife = 86400*138.376
		elif protons == 85: 
			halflife = 56
		elif protons == 86: 
			halflife = 86400*3.8235
		elif protons == 87: 
			halflife = 60*4.801
		elif protons == 88: 
			halflife = 86400*365.25*1599
		elif protons == 89: 
			halflife = 86400*365.25*21.772
		elif protons == 90: 
			halflife = 86400*365.25*pow(10,10)*1.405
		elif protons == 91: 
			halflife = 86400*365.25*32650
		elif protons == 92: 
			halflife = 86400*365.25*pow(10,9)*4.468
		elif protons == 93: 
			halflife = 86400*365.25*pow(10,6)*2.144
		elif protons == 94: 
			halflife = 86400*365.25*pow(10,7)*8.13
		elif protons == 95: 
			halflife = 86400*365.25*7350
		elif protons == 96: 
			halflife = 86400*365.25*pow(10,7)*1.56
		elif protons == 97: 
			halflife = 86400*365.25*1380
		elif protons == 98: 
			halflife = 86400*365.25*898
		elif protons == 99: 
			halflife = 86400*471.7
		elif protons == 100: 
			halflife = 86400*100.5
		elif protons == 101: 
			halflife = 86400*51.59
		elif protons == 102: 
			halflife = 60*58
		elif protons == 103: 
			halflife = 3600*11
		elif protons == 104: 
			halflife = 60*48
		elif protons == 105: 
			halflife = 3600*16
		elif protons == 106: 
			halflife = 60*9.8
		elif protons == 107: 
			halflife = 60*2.4
		elif protons == 108: 
			halflife = 130
		elif protons == 109: 
			halflife = 4
		elif protons == 110: 
			halflife = 14
		elif protons == 111: 
			halflife = 130
		elif protons == 112: 
			halflife = 30
		elif protons == 113: 
			halflife = 9.5
		elif protons == 114: 
			halflife = 2.1
		elif protons == 115: 
			halflife = 0.65
		elif protons == 116: 
			halflife = 0.08
		elif protons == 117: 
			halflife = 0.051
		elif protons == 118: 
			halflife = 0.0007
		else: halflife = INF
	elif protons <= 118 and nuclidemap_value == 1: halflife = INF
	elif protons > 118: halflife = 0.1/mass
	
	#radiation color
	if protons in [61,118]: rad_color = [0,1,0.5]
	elif protons == 86: rad_color = [1,1,0]
	elif protons in [88,92]: rad_color = [0,1,0]
	elif protons == 96: rad_color = [1,0.5,0.75]
	elif protons == 112: rad_color = [0,1,1]
	elif protons == 114: rad_color = [1,0.75,0.25]
	else: rad_color = [0.25,0.5,1]
	if date[0] != 6 and date != [3,31]:
		$radiation.modulate.r = rad_color[0]
		$radiation.modulate.g = rad_color[1]
		$radiation.modulate.b = rad_color[2]
	
	generate_features()
	
	#collision
	if protons == 2: 
		$col_body.position.y = 1
	elif protons == 42: 
		$col_body.position.y = 6
	elif protons == 55: 
		$col_body.position.y = 31
	#elif protons == 87 and mass == 212:
	#	$col_body.position.y = 29 
	elif protons == 120: 
		$col_body.position.y = 12
	else: 
		$col_body.position.y = 4
	
	#info
	if protons <= 118 and protons >= 0: 
		if antimuons == 0 or protons == 0:
			$info/name.text = elements[protons]
			$info/symbol.text = symbols[protons]
		else:
			$info/name.text = "Mu-" + elements[protons]
			$info/symbol.text = "μ" + symbols[protons]
	elif protons > 118: 
		var numstr = str(protons)
		var syl1 = ["Nil","Un","Bi","Tri","Quad","Pent","Hex","Sept","Oct","Enn"]
		var syl2 = ["nil","un","bi","tri","quad","pent","hex","sept","oct","enn"]
		var syl3 = ["nil","un","b","tr","quad","pent","hex","sept","oct","enn"]
		var result = syl1[int(numstr[0])] + syl2[int(numstr[1])]
		var l1 = "NUBTQPHSOE"
		var l2 = "nubtqphsoe"
		var sym = l1[int(numstr[0])]
		for s in (str(protons).length()):
			if s >= 0:
				if s > 2: result += syl2[int(numstr[s-1])]
				if s > 0: sym += l2[int(numstr[s])]
				s -= 1
				if s == str(protons).length()-2:
					result += syl3[int(numstr[str(protons).length()-1])] + "ium"
		if antimuons == 0:
			$info/name.text = result
			$info/symbol.text = sym
		else:
			$info/name.text = "Mu-" + result
			$info/symbol.text = "μ" + sym
	$info/num.text = str(int(protons))
	$info/mass.text = str(int(mass))
	if protons == 0 and neutrons == 0 and electrons == 0 and antimuons == 1: $info/name.text = "Antimuon"
	if protons == 1 and neutrons == 0 and electrons == 0: $info/name.text = "Proton"
	if protons == 2 and neutrons == 2 and electrons == 0: $info/name.text = "Alpha particle"
	
	#isotopes
	if protons < 119 and mass != main_isotopes[protons]:
		$model/body.play("isotopes")
		if [protons,mass] == [1,2]:
			if antimuons == 0:
				$info/name.text = "Deuterium"
				$info/symbol.text = "D"
			else:
				$info/name.text = "Mu-Deuterium"
				$info/symbol.text = "μD"
			$model/body.frame = 1
		elif [protons,mass] == [1,3]:
			halflife = 86400*365.25*12.32
			if antimuons == 0:
				$info/name.text = "Tritium"
				$info/symbol.text = "T"
			else:
				$info/name.text = "Mu-Tritium"
				$info/symbol.text = "μT"
			$model/body.frame = 2
			eye1 = 1
			eye2 = 1
		elif protons == 1 and neutrons in range(2,7):
			halflife = pow(10,-9)
			$model/body.frame = neutrons
		elif [protons,mass] == [2,2]:
			halflife = pow(10,-9)
			$model/body.frame = 7
			$model/face/eye1.play("isotopes")
			$model/face/eye2.play("isotopes")
			eye1 = 1
			eye2 = 1
		elif [protons,mass] == [2,3]:
			$model/body.frame = 8
			$model/face/eye1.play("isotopes")
			$model/face/eye2.play("isotopes")
			$model/face/eye3.play("isotopes")
			eye1 = 2
			eye2 = 2
		elif [protons,mass] == [3,3]:
			$model/body.frame = 103
			$model/face/eye4.visible = true
			$model/face/eye1.play("isotopes")
			$model/face/eye2.play("isotopes")
			$model/face/eye4.play("isotopes")
			eye1 = 49
			eye2 = 49
			$model/face/eye4.frame = 48
		elif [protons,mass] == [3,6]:
			$model/body.frame = 61
		elif [protons,mass] == [6,14]:
			halflife = 86400*365.25*5700
			if antimuons == 0: $info/name.text = "Radiocarbon"
			else: $info/name.text = "Mu-Radiocarbon"
			$model/body.frame = 9
			$model/face/eye1.play("isotopes")
			$model/face/eye2.play("isotopes")
			eye1 = 3
			eye2 = 3
			mouth = 2
		elif [protons,mass] == [7,13]:
			halflife = 60*9.965
			$model/body.frame = 10
			$model/face/eye1.play("isotopes")
			$model/face/eye2.play("isotopes")
			eye1 = 0
			eye2 = 0
		elif [protons,mass] == [8,15]:
			halflife = 122.3
			$model/body.frame = 11
		elif [protons,mass] == [8,23]:
			$model/body.frame = 93
		elif [protons,mass] == [10,22]:
			$model/body.frame = 88
			$model/face/mouth/fangs.visible = true
			$model/face/mouth.play("default")
			$model/face/mouth.frame = 1
			$model/face/eye1.play("default")
			$model/face/eye2.play("default")
			eye1 = 0
			eye2 = 0
			$model/face/mouth.self_modulate = Color(0.0, 0.0, 0.0, 1.0)
		elif [protons,mass] == [13,26]:
			halflife = 86400*365.25*717000
			$model/body.frame = 12
			$model/face/eye1.play("isotopes")
			$model/face/eye2.play("isotopes")
			eye1 = 4
			eye2 = 4
		elif [protons,mass] == [19,40]:
			halflife = 86400*365.25*1.248*pow(10,9)
			$model/body.frame = 13
			$model/face/eye1.play("isotopes")
			$model/face/eye2.play("isotopes")
			eye1 = 0
			eye2 = 0
		elif [protons,mass] == [20,47]:
			halflife = 86400*4.536
			$model/body.frame = 14
			$model/face/eye1.play("isotopes")
			$model/face/eye2.play("isotopes")
			eye1 = 5
			eye2 = 5
		elif [protons,mass] == [20,48]:
			halflife = 86400*4.536
			$model/body.frame = 52
			$model/face/eye1.play("isotopes")
			$model/face/eye2.play("isotopes")
			eye1 = 30
			eye2 = 30
		elif [protons,mass] == [20,52]:
			halflife = 86400*4.536
			$model/body.frame = 53
			$model/face/eye1.play("isotopes")
			$model/face/eye2.play("isotopes")
			eye1 = 31
			eye2 = 31
		elif [protons,mass] == [22,44]:
			halflife = 86400*365.25*59.1
			$model/body.frame = 15
			look_x = clamp(look_x,-2,2)
			look_y = clamp(look_y,-2,1)
			$model/face/eye1.play("isotopes")
			$model/face/eye2.play("default")
			eye1 = 6
			eye2 = 8
		elif [protons,mass] == [26,54]:
			$model/body.frame = 16
			$model/face/spot.play("isotopes")
			spot = 0
			eye2 = 7
		elif [protons,mass] == [26,55]:
			halflife = 86400*365.25*2.73
			$model/body.frame = 17
			$model/face/eye1.play("isotopes")
			$model/face/eye2.play("isotopes")
			eye1 = 7
			eye2 = 7
		elif [protons,mass] == [26,57]:
			$model/body.frame = 18
			$model/face/eye1.play("isotopes")
			$model/face/eye2.play("isotopes")
			eye1 = 8
			eye2 = 9
		elif [protons,mass] == [26,58]:
			$model/body.frame = 19
		elif [protons,mass] == [26,59]:
			$model/body.frame = 20
		elif [protons,mass] == [26,60]:
			halflife = 86400*365.25*2.73
			$model/body.frame = 21
			$model/face/eye1.play("isotopes")
			$model/face/eye2.play("isotopes")
			$model/face/spot.play("isotopes")
			spot = 1
			eye1 = 10
			eye2 = 10
		elif [protons,mass] == [27,60]:
			halflife = 86400*365.25*5.2714
			$model/body.frame = 22
			$model/face/eye1.play("isotopes")
			$model/face/eye2.play("isotopes")
			$model/face/spot.modulate = Color8(255,220,150)
			eye1 = 11
			eye2 = 11
		elif [protons,mass] == [27,56]:
			$model/body.frame = 92
			$model/face/eye1.play("isotopes")
			$model/face/eye2.play("isotopes")
			$model/face/spot.visible = false
			eye1 = 11
			eye2 = 11
		elif [protons,mass] == [33,71]:
			halflife = 3600*65.3
			$model/body.frame = 23
			$model/face/eye1.play("isotopes")
			$model/face/eye2.play("isotopes")
			eye1 = 12
			eye2 = 12
		elif [protons,mass] == [33,72]:
			halflife = 3600*26
			$model/body.frame = 24
			$model/face/eye1.play("isotopes")
			$model/face/eye2.play("isotopes")
			eye1 = 13
			eye2 = 13
		elif [protons,mass] == [33,73]:
			halflife = 86400*80.3
			$model/body.frame = 25
			$model/face/eye1.play("isotopes")
			$model/face/eye2.play("isotopes")
			eye1 = 14
			eye2 = 14
		elif [protons,mass] == [33,74]:
			halflife = 86400*17.77
			$model/body.frame = 26
			$model/face/eye1.play("isotopes")
			$model/face/eye2.play("isotopes")
			eye1 = 15
			eye2 = 15
		elif [protons,mass] == [33,76]:
			halflife = 86400*1.0933
			$model/body.frame = 27
			$model/face/eye1.play("isotopes")
			$model/face/eye2.play("isotopes")
			eye1 = 16
			eye2 = 16
		elif [protons,mass] == [33,77]:
			halflife = 3600*38.79
			$model/body.frame = 28
			$model/face/eye1.play("isotopes")
			$model/face/eye2.play("isotopes")
			eye1 = 17
			eye2 = 17
		elif [protons,mass] == [36,81]:
			$model/body.frame = 102
		elif [protons,mass] == [37,87]:
			$model/body.frame = 101
			$model/face/eye2.play("isotopes")
			eye2 = 47
		elif [protons,mass] == [38,90]:
			halflife = 86400*365.25*28.91
			$model/body.frame = 29
			$model/face/eye1.play("default")
			$model/face/eye2.play("isotopes")
		elif [protons,mass] == [39,90]:
			$model/body.frame = 80
			$model/face/eye1.play("isotopes")
			$model/face/eye2.play("isotopes")
			eye1 = 36
			eye2 = 36
		elif [protons,mass] == [42,92]:
			$model/body.frame = 30
			$model/hair.play("isotopes")
			$model/hair.frame = 0
			$model/face/eye1.play("isotopes")
			$model/face/eye2.play("isotopes")
			eye1 = 19
			eye2 = 19
		elif [protons,mass] == [42,93]:
			halflife = 86400*365.25*4839
			$model/body.frame = 31
			$model/face/eye1.play("isotopes")
			$model/face/eye2.play("isotopes")
			eye1 = 20
			eye2 = 20
		elif [protons,mass] == [42,94]:
			$model/body.frame = 32
			$model/face/eye1.play("isotopes")
			$model/face/eye2.play("isotopes")
			eye1 = 21
			eye2 = 21
		elif [protons,mass] == [42,95]:
			$model/body.frame = 33
			$model/hair.play("isotopes")
			$model/hair.frame = 1
		elif [protons,mass] == [42,96]:
			$model/body.frame = 34
		elif [protons,mass] == [42,99]:
			$model/body.frame = 35
			$model/face/eye1.play("isotopes")
			$model/face/eye2.play("isotopes")
			eye1 = 22
			eye2 = 22
		elif [protons,mass] == [42,100]:
			$model/body.frame = 36
			$model/hair.play("isotopes")
			$model/hair.frame = 2
			$model/face/eye1.play("isotopes")
			$model/face/eye2.play("isotopes")
			eye1 = 23
			eye2 = 23
		elif [protons,mass] == [49,114]:
			$model/body.frame = 60
		elif [protons,mass] == [52,128]:
			halflife = 86400*365.25*2.25*pow(10,24)
			$model/body.frame = 95
			$model/face/eye1.play("isotopes")
			$model/face/eye2.play("isotopes")
			$model/face/mouth.self_modulate = Color(1.0, 1.0, 1.0, 1.0)
			eye1 = 44
			eye2 = 44
		elif [protons,mass] == [53,135]:
			$model/body.frame = 59
		elif [protons,mass] == [54,133]:
			halflife = 86400*5.2474
			$model/body.frame = 37
			$model/face/eye1.play("isotopes")
			$model/face/eye2.play("isotopes")
			$model/face/spot.visible = false
			eye1 = 24
			eye2 = 24
		elif [protons,mass] == [54,135]:
			$model/body.frame = 78
			$nucleus/body.frame = 124
			$model/face/eye1.play("isotopes")
			$model/face/eye2.play("isotopes")
			$model/face/spot.visible = false
			$model/face/mouth.frame = 0
			eye1 = 35
			eye2 = 35
		elif [protons,mass] == [54,136]:
			$model/body.frame = 79
			$model/face/spot.visible = false
		elif [protons,mass] == [54,140]:
			$model/body.frame = 98
			$model/face/spot.visible = false
			$model/face/eye1.play("isotopes")
			$model/face/eye2.play("isotopes")
			eye1 = 45
			eye2 = 45
		elif [protons,mass] == [55,137]:
			$model/body.frame = 57
			$nucleus/body.frame = 121
			$nucleus/face/eye1.frame = 36
			$nucleus/face/eye1.play("isotopes")
			$nucleus/face/eye2.visible = false
			$model/face/eye1.play("isotopes")
			$model/face/eye2.visible = false
			$model/face/spot.play("isotopes")
			$model/face/spot.visible = true
			spot = 4
			eye1 = 36
		elif [protons,mass] == [56,154]:
			$model/body.frame = 97
			$model/face/spot.visible = false
			$model/face/eye1.play("isotopes")
			$model/face/eye2.play("isotopes")
			eye1 = 50
			eye2 = 51
			$model/face/mouth.self_modulate = Color("ff5500ff")
		elif [protons,mass] == [59,142]:
			halflife = 3600*19.12
			$model/body.frame = 38
		elif [protons,mass] == [59,143]:
			halflife = 86400*13.57
			$model/body.frame = 39
		elif [protons,mass] == [60,144]:
			$model/body.frame = 62
		elif [protons,mass] == [60,146]:
			$model/body.frame = 63
		elif [protons,mass] == [60,148]:
			$model/body.frame = 64
		elif [protons,mass] == [60,150]:
			$model/body.frame = 65
		elif [protons,mass] == [60,163]:
			$model/body.frame = 81
			$model/face/eye1.play("isotopes")
			$model/face/eye2.play("isotopes")
			eye1 = 39
			eye2 = 39
		elif [protons,mass] == [64,160]:
			$model/body.frame = 96
		elif [protons,mass] == [76,184]:
			$model/body.frame = 67
			$model/hair.visible = 1
			$model/hair.play("isotopes")
			$model/hair.frame = 11
		elif [protons,mass] == [76,185]:
			$model/body.frame = 68
			$model/hair.visible = 1
			$model/hair.play("isotopes")
			$model/hair.frame = 4
		elif [protons,mass] == [76,186]:
			$model/body.frame = 69
			$model/hair.visible = 1
			$model/hair.play("isotopes")
			$model/hair.frame = 10
		elif [protons,mass] == [76,187]:
			$model/body.frame = 70
			$model/hair.visible = 1
			$model/hair.play("isotopes")
			$model/hair.frame = 9
		elif [protons,mass] == [76,188]:
			$model/body.frame = 71
			$model/hair.visible = 1
			$model/hair.play("isotopes")
			$model/hair.frame = 8
		elif [protons,mass] == [76,189]:
			$model/body.frame = 72
			$model/hair.visible = 1
			$model/hair.play("isotopes")
			$model/hair.frame = 7
		elif [protons,mass] == [76,190]:
			$model/body.frame = 73
			$model/hair.visible = 1
			$model/hair.play("isotopes")
			$model/hair.frame = 6
			credit = "Oxygendox"
		elif [protons,mass] == [76,194]:
			$model/body.frame = 74
			$model/hair.visible = 1
			$model/hair.play("isotopes")
			$model/hair.frame = 5
		elif [protons,mass] == [77,192]:
			halflife = 86400*73.827
			$model/body.frame = 40
			$model/face/eye4.play("default")
			$model/face/eye4.frame = 58
			$model/face/eye3.visible = true
			$model/face/spot.visible = false
			
		elif [protons,mass] == [78,190]:
			halflife = 86400*365.25*4.83*pow(10,11)
			$model/body.frame = 41
		elif [protons,mass] == [79,194]:
			$model/body.frame = 94
			$model/face/eye1.play("isotopes")
			eye1 = 43
		elif [protons,mass] == [79,195]:
			halflife = 86400*186.01
			$model/body.frame = 42
			$model/face/eye1.play("isotopes")
			$model/face/eye2.play("isotopes")
			eye1 = 25
			eye2 = 25
		elif [protons,mass] == [79,196]:
			halflife = 86400*6.165
			$model/body.frame = 43
			$model/face/eye1.play("isotopes")
			$model/face/eye2.play("isotopes")
			eye1 = 26
			eye2 = 26
		elif [protons,mass] == [79,198]:
			halflife = 86400*2.695
			$model/body.frame = 45
			$model/face/eye1.play("isotopes")
			$model/face/eye2.play("isotopes")
			eye1 = 27
			eye2 = 27
		elif [protons,mass] == [79,199]:
			halflife = 86400*3.139
			$model/body.frame = 44
			$model/face/eye1.play("isotopes")
			$model/face/eye2.play("isotopes")
			eye1 = 28
			eye2 = 28
		elif [protons,mass] == [81,201]:
			halflife = 86400*3.0421
			$model/body.frame = 46
			$model/face/eye1.play("isotopes")
			$model/face/eye2.play("isotopes")
			$model/face/spot.play("isotopes")
			eye1 = 29
			eye2 = 29
			spot = 2
		elif [protons,mass] == [81,203]:
			$model/body.frame = 47
		elif [protons,mass] == [85,210]:
			halflife = 3600*8.1
			$model/body.frame = 48
		elif [protons,mass] == [87,212]:
			$model/body.frame = 82
			$model/face/eye1.play("isotopes")
			$model/face/eye2.play("isotopes")
			$model/face/mouth.self_modulate = Color(1.0, 1.0, 1.0, 1.0)
			eye1 = 0
			eye2 = 40
		elif [protons,mass] == [87,221]:
			$model/body.frame = 90
			$model/face/mouth.self_modulate = Color(1.0, 1.0, 1.0, 1.0)
		elif [protons,mass] == [88,223]:
			halflife = 86400*11.4352
			$model/body.frame = 49
			if $model/ra_glow.visible == true:
				$model/ra_glow.hide()
				$model/ra223_glow.show()
		elif [protons,mass] == [90,230]:
			$model/body.frame = 75
			$nucleus/body.frame = 122
			$model/face/eye2.visible = false
			$nucleus/face/eye2.visible = false
		elif [protons,mass] == [90,234]:
			$model/body.frame = 76
		elif [protons,mass] == [91,230]:
			halflife = 86400*17.4
			$model/body.frame = 50
		elif [protons,mass] == [91,233]:
			halflife = 86400*26.975
			$model/body.frame = 51
		elif [protons,mass] == [92,236]:
			$model/body.frame = 100
			$model/face/eye2.visible = false
		elif [protons,mass] == [94,243]:
			$model/body.frame = 89
			$model/face/eye1.play("isotopes")
			$model/face/eye2.play("isotopes")
			$model/face/eye3.play("isotopes")
			eye1 = 42
			eye2 = 42
			pupil1 = 1
			pupil2 = 1
			$model/face/eye3.frame = 42
			$model/face/eye3.offset.y = 6
			$model/face/eye2.offset.y = 4
			$model/face/eye3.visible = true
			$model/face/spot.visible = false
			$model/face/mouth.visible = false
			$model/face/pupils.visible = true
			$model/face/pupils/pupil3.visible = true
			$model/face/pupils/pupil3.offset.y = 5
			$model/face/pupils.modulate = Color(1.0, 1.0, 1.0, 0.5)
		elif [protons,mass] == [95,228]:
			$model/body.frame = 86
		elif [protons,mass] == [95,243]:
			$model/body.frame = 99
			$model/face/eye1.play("isotopes")
			$model/face/eye2.play("isotopes")
			eye1 = 46
			eye2 = 46
			$model/face/mouth.self_modulate = Color("002147ff")
		elif [protons,mass] == [96,242]:
			$model/body.frame = 54
			$model/face/eye1.play("isotopes")
			$model/face/eye2.play("isotopes")
			eye1 = 38
			eye2 = 38
		elif [protons,mass] == [96,248]:
			$model/body.frame = 55
			$model/face/eye1.play("isotopes")
			$model/face/eye2.play("isotopes")
			eye1 = 32
			eye2 = 32
		elif [protons,mass] == [99,251]:
			$model/body.frame = 58
			$model/face/eye1.play("isotopes")
			$model/face/eye2.play("isotopes")
			$model/face/glasses.visible = true
			$model/face/eye1.visible = false
			$model/face/eye2.visible = false
			glasses = 8
			eye1 = 33
			eye2 = 33
		elif [protons,mass] == [112,277]:
			$model/body.frame = 56
			$model/face/eye1.play("isotopes")
			$model/face/eye2.visible = false
			eye1 = 37
		elif [protons,mass] == [112,288]:
			$model/body.frame = 85
			$model/face/eye1.play("isotopes")
			$model/face/eye2.play("isotopes")
			$model/face/eye3.play("isotopes")
			eye1 = 52
			eye2 = 52
			$model/face/eye3.frame = 52
			$model/face/eye3.offset.y = 6
			$model/face/eye3.visible = true
		elif [protons,mass] == [117,292]:
			$model/body.frame = 87
			$model/face/spot.play("isotopes")
			$model/face/spot.visible = true
			$model/face/mouth.self_modulate = Color(1.0, 1.0, 1.0, 1.0)
			$model/face/eye1.self_modulate = Color(1.0, 1.0, 1.0, 1.0)
			$model/face/eye2.self_modulate = Color(1.0, 1.0, 1.0, 1.0)
			spot = 5
		elif [protons,mass] == [117,293]:
			$model/body.frame = 91
			$model/face/spot.play("isotopes")
			$model/face/spot.visible = true
			$model/face/spot.play("isotopes")
			$model/face/spot.visible = true
			spot = 6
		elif [protons,mass] == [117,295]:
			$model/body.frame = 77
			$nucleus/body.frame = 123
			$model/face/eye1.play("isotopes")
			$model/face/eye2.play("isotopes")
			$model/hair.visible = true
			$model/hair.play("isotopes")
			$model/hair.frame = 3
			$model/face/spot.play("isotopes")
			$model/face/spot.visible = true
			spot = 3
			eye1 = 34
			eye2 = 34
		elif [protons,mass] == [118,297]:
			$model/body.frame = 83
		elif [protons,mass] == [118,298]:
			$model/body.frame = 84
		elif [protons,mass] == [118,300]:
			$model/body.frame = 66
		else: 
			if nuclidemap_value == 1: halflife = INF
			else: halflife = 0.001 + (nuclidemap_value*20)**10
			$model/body.play("default")
			$model/body.frame = protons
			$model/face/eye1.play("default")
			$model/face/eye2.play("default")
	$nucleus/face/eye1.animation = $model/face/eye1.animation
	$nucleus/face/eye2.animation = $model/face/eye2.animation
	
	#geiger counter noise
	if halflife > 86400*365.25*1000000: $geiger.base_vol = -30
	elif halflife > 86400*365.25*1000: $geiger.base_vol = -20
	elif halflife > 86400*365.25*10: $geiger.base_vol = -15
	elif halflife > 86400*365.25: $geiger.base_vol = -10
	elif halflife > 86400: $geiger.base_vol = -5
	else: $geiger.base_vol = 0
	
	
	
	#eyes & spots again
	if protons in [6,25,35,85,86,97,118,119]: 
		if eye1 == 1: $model/face/eye1.self_modulate.v = 1
	elif protons == 64: 
		if eye1 == 1: $model/face/eye1.self_modulate.v = 0.75
	else: 
		if eye1 == 1 or protons > 120: $model/face/eye1.self_modulate.v = 0
		else: $model/face/eye1.self_modulate.v = 1
	$model/face/eye2.self_modulate.v = $model/face/eye1.self_modulate.v
	$nucleus/face/eye1.self_modulate.v = $model/face/eye1.self_modulate.v
	$nucleus/face/eye2.self_modulate.v = $model/face/eye1.self_modulate.v
	$model/face/spot.frame = spot
	
	#update AI
	$range.scale = Vector2.ONE*0.001
	
	#gas & drip colors
	if protons == 55: $gas.color = $model/body.sprite_frames.get_frame_texture("default",protons).get_image().get_pixel(64,110)
	elif protons >= 0: $gas.color = $model/body.sprite_frames.get_frame_texture($model/body.animation,$model/body.frame).get_image().get_pixel(64,84)
	$drip.color = $gas.color
	
	#Horrid Miasma
	$br_miasma.emitting = protons == 35
	
	#spacetime rifts around insanely heavy guys
	$rift.emitting = protons > 120
	@warning_ignore("integer_division")
	$rift.modulate.a = (protons-120)/1000
	
	# Designer credits --- isotopes
	if [protons,mass] in [[1,4],[1,6],[1,7]]:
		credit = "CiaaiK"
	elif [protons,mass] in [[1,5],[3,6],[7,13],[8,15],[13,26]]:
		credit = "gammaray-burst"
	elif [protons,mass] in [20,47]:
		credit = "starri-cosmikat"
	elif [protons,mass] in [[20,48],[60,163],[87,212],[95,243]]:
		credit = "theticktock_ticky"
	elif [protons,mass] in [[20,52],[36,81],[39,90],[53,135],[54,135],[54,136],[54,140],[55,137],[76,185],[81,201],[90,230],[92,236],[96,242],[117,295]]:
		credit = "Inky"
	elif [protons,mass] in [[22,44],[26,60],[27,60],[33,71],[33,72],[33,73],[33,74],[33,76],[33,77],[42,92],[42,93],[42,94],[42,95],[42,96],[42,97],[42,99],[42,100],[76,186],[77,192],[78,190],[79,195],[79,196],[79,198],[79,199],[99,251]]:
		credit = "SciphonPylon"
	elif [protons,mass] in [[26,54],[26,58],[26,59]]:
		credit = "thatmarkerdude"
	elif [protons,mass] in [[26,57],[81,201],[81,203],[76,190]]:
		credit = "ir1sh"
	elif [protons,mass] in [37,87]:
		credit = "T.S.Smith"
	elif [protons,mass] in [49,114]:
		credit = "ingrid-pulchrea"
	elif [protons,mass] in [56,138]:
		credit = "Nostuyx"
	elif [protons,mass] in [[60,144],[60,146],[60,148],[60,150],[118,298],[118,299]]:
		credit = "Mr.Media2K"
	elif [protons,mass] in [[76,188],[118,300]]:
		credit = "Senchium"
	elif [protons,mass] in [[76,187],[76,184]]:
		credit = "Oxygendox"
	elif [protons,mass] in [76,189]:
		credit = "bhapydageek"
	elif [protons,mass] in [[76,188],[76,194]]:
		credit = "Amy Isolea"
	elif [protons,mass] in [85,210]:
		credit = "Shard"
	elif [protons,mass] in [[87,221],[94,243],[112,277],[112,285],[112,288]]:
		credit = "twitcheeer"
	elif [protons,mass] in [95,228]:
		credit = "The__Professional"
	elif [protons,mass] in [96,248]:
		credit = "alvy-ingenerum, haniszar36"
	elif [protons,mass] in [117,292]:
		credit = "Ruins"
	# Designer credits --- main
	elif protons == 18: credit = "Oberorka & baltdev"
	elif protons in [21,27]: credit = "mobropro"
	elif protons == 24: credit = "Oberorka, carrera075 & sonnettheseacoat"
	elif protons == 25: credit = "anonymous"
	elif protons == 32: credit = "radonine"
	elif protons in [34,91,100]: credit = "sonnettheseacoat"
	elif protons == 38: credit = "baltdev"
	elif protons == 39: credit = "Oberorka & abugidaithink"
	elif protons in [40,48,59,69,96,102,103]: credit = "Shard"
	elif protons == 42: credit = "ir1sh, SciphonPylon & Oberorka"
	elif protons == 45: credit = "Oberorka & SED4906"
	elif protons == 46: credit = "chessbird"
	elif protons == 51: credit = "sylsoddsandends"
	elif protons in [54,86,94]: credit = "Oberorka & SciphonPylon"
	elif protons in [57,66]: credit = "clover-the-servine, SciphonPylon & Oberorka"
	elif protons == 61: credit = "nonbinarymissingno & wk"
	elif protons == 63: credit = "ir1sh, Velcrow101, SciphonPylon & Oberorka"
	elif protons == 67: credit = "leaf404"
	elif protons == 72: credit = "Shard & ir1sh"
	elif protons == 73: credit = "derpy-jacob-903"
	elif protons == 76: credit = "Lotus"
	elif protons == 81: credit = "Velcrow101, chessbird & Oberorka"
	elif protons == 83: credit = "Oberorka & jojostardustcrusaders"
	elif protons == 85: credit = "Oberorka & Shard"
	elif protons == 87: credit = "Oberorka & voodoo-economics"
	elif protons == 89: credit = "clover-the-servine & ir1sh"
	elif protons == 98: credit = "whail, ir1sh, thatmarkerdude, autism-detector, haniszar36 & lythic-felinementals"
	elif protons == 101: credit = "03113"
	elif protons == 104: credit = "Shard, vitasnova & Oberorka"
	elif protons == 105: credit = "Cheez & ir1sh"
	elif protons == 106: credit = "cosmosnaught"
	elif protons == 107: credit = "hyperoperationfractallisation & Oberorka"
	elif protons == 108: credit = "Lotus, cosmosnaught & Oberorka"
	elif protons == 109: credit = "Shard, voodoo-economics, haniszar36 & ir1sh"
	elif protons == 110: credit = "SciphonPylon"
	elif protons == 114: credit = "starri-cosmikat & SciphonPylon"
	elif protons == 115: credit = "The Wizard Slime, schoolshootingbyclover & Jupiter Stupider"
	elif protons == 116: credit = "SciphonPylon, breadcharger61 & Oberorka"
	elif protons == 118: credit = "bigpinkanimal & Oberorka"
	else: credit = "Oberorka"
	
	$credit.visible = electrons > 0
	if protons > 118: note = "In real life, this element has yet to be discovered.\nIt has a systematic name that quite literally means ''" + str(protons) + "-ium''."
	else: note = ""
	if protons > 120: $credit.tooltip_text = note
	else: $credit.tooltip_text = "design by " + credit + "\n\n" + note
	
	#jump to prevent bugs
	if glob.catto_ai == true:
		if group != "noble gas" and is_on_floor(): 
			if protons in [3,27]: velocity.y -= 300 * sqrt(glob.temperature/273.15) * glob.rate
			else: velocity.y -= 100 * sqrt(glob.temperature/273.15) * glob.rate
		else: velocity.y -= 10 * sqrt(glob.temperature/273.15) * glob.rate

func calculate_mass():
	mass = protons+neutrons

func calculate_stability():
	if protons < 118 and neutrons < 178 and protons >= 0 and neutrons >= 0: 
		nuclidemap_value = load("res://ec_assets/textures/nuclidemap.png").get_image().get_pixel(protons,neutrons).v
	else: 
		nuclidemap_value = 0

func decay_into(mode,explode):
	if glob.endable_world == true:
		if protons > 10000: get_tree().change_scene_to_file("res://ec_assets/scenes/big_crunch.tscn")
		elif protons > 2000:
			if glob.camera.preset == 3: get_tree().change_scene_to_file("res://ec_assets/scenes/space_explodes.tscn")
			elif glob.camera.preset == 4: get_tree().change_scene_to_file("res://ec_assets/scenes/sun_explodes.tscn")
		elif protons > 500 and glob.camera.preset in [0,1]: get_tree().change_scene_to_file("res://ec_assets/scenes/earth_explodes.tscn")
		elif protons > 200 and glob.camera.preset == 2: get_tree().change_scene_to_file("res://ec_assets/scenes/moon_explodes.tscn")
	
	if explode == true:
		var scene = load("res://ec_assets/objects/explosion.tscn")
		var instance = scene.instantiate()
		instance.position = position
		add_sibling(instance)
	
	if mode == 1:
		protons -= 2
		neutrons -= 2
		spawn_catto(2,2,0,0)
	if mode == 2:
		protons += 1
		neutrons -= 1
		emit("electron")
		emit("antineutrino")
	if mode == 3:
		protons -= 1
		neutrons += 1
		emit("positron")
		emit("neutrino")
	if mode == 4:
		@warning_ignore("integer_division")
		spawn_catto(protons-protons/2,neutrons-neutrons/2,electrons-electrons/2,0)
		protons /= 2
		neutrons /= 2
		electrons /= 2
	if mode == 5:
		emit("neutron")
		neutrons -= 1
	if mode == 6:
		emit("neutrino")
		protons -= 1
		neutrons += 1
		electrons -= 1
	if mode == 7:
		protons -= 1
		spawn_catto(1,0,0,0)
	
	if protons >= 0 and mass >= 0: 
		calculate_mass()
		calculate_stability()
		update()
	else: destroy("explosion")
	
	decay = tan(deg_to_rad(randf_range(0,90)))*halflife
	interest = null
	disinterest = null
	
	if explode == false: flash()

func emit(prt):
	var scene = load("res://ec_assets/objects/particle.tscn")
	var instance = scene.instantiate()
	instance.position = position
	instance.type = prt
	if instance.type == "neutron": decay = INF
	instance.emit = 0.25
	add_sibling(instance)
	$flash.modulate.a = 0.5

func spawn_catto(p,n,e,mu):
	var scene = load("res://ec_assets/objects/element_catto.tscn")
	var instance = scene.instantiate()
	instance.player_spawned = false
	instance.position.x = position.x
	instance.position.y = position.y-100
	instance.velocity.x = [-200,200].pick_random() * glob.rate
	instance.velocity.y = -300 * glob.rate
	instance.protons = p
	instance.neutrons = n
	instance.electrons = e
	instance.antimuons = mu
	if instance.protons == 0: instance.electrons = 1
	add_sibling(instance)

func _on_body_entered(body):
	if body != null:
		if (body is element_catto or body is purrcent or body is bungy) and body.position.y < position.y-16:
			if state == "gas" and body.density > density and glob.poof == true and cloud == false:
				poof()
				cloud = true
		if body is element_catto and body != self:
			if (protons == 1 or group in ["alkali metal","halogen"]) and body.onfire == true: onfire = true
			if (velocity.length() > 5000*glob.fusion_threshold or body.velocity.length() > 5000*glob.fusion_threshold or (glob.t_power > 3 and protons+body.protons <= 26)) and glob.fusion_threshold < 3 and body.id < id and !(protons == 0 and body.protons == 0):
				if body.protons == 0 or protons == 0: 
					if glob.weakforce == true:
						emit("positron")
						emit("neutrino")
						emit("neutrino")
					else:
						antimuons += body.antimuons
				decay = INF
				protons += body.protons
				neutrons += body.neutrons
				electrons += body.electrons
				antimuons += body.antimuons
				flash()
				position += (body.position-position)/2
				glob.cattos -= 1
				body.queue_free()
			if body.protons != protons:
				if protons == 27 and body.protons == 60:
					$model/face/eye1.play("shut")
				if protons in [27,62] and body.protons in [27,62]:
					$model/face/eye1.play("happy")
				if protons == 33 and body.protons == 30:
					destroy("poof")
				if protons in [43,75] and body.protons in [43,75]:
					$model/face/eye1.play("happy")
				if protons in [45,46] and body.protons in [45,46]:
					$model/face/eye1.play("happy")
				if protons == 60 and body.protons in [26,27,28]:
					$model/face/eye1.play("happy")
				if protons in [76,78] and body.protons in [76,78]:
					$model/face/eye1.play("happy")
				if protons in [97,117] and body.protons in [97,117]:
					$model/face/eye1.play("happy")
			else:
				if [protons,mass] == [33,75] and body.protons == 33 and body.mass != mass:
					$model/face/eye1.play("shut")
		if body is bungy and protons == 43:
			$model/face/eye1.play("happy")

func _on_body_exited(body):
	if body != null:
		if body is element_catto or body is bungy: update()

func _on_area_entered(area):
	if area != null:
		if area is particle and area.emit <= 0:
			if area.type == "electron" and electrons < max_electrons:
				electrons += 1
				flash()
				glob.particles -= 1
				area.queue_free()
				if protons != 25: $meow.play()
			if area.type == "neutron":
				if protons == 0: emit("neutron")
				else: 
					neutrons += 1
					decay = INF
				flash()
				glob.particles -= 1
				area.queue_free()
				if protons != 25: $meow.play()
			if area.type == "positron" and electrons > 0:
				electrons -= 1
				emit("photon")
				emit("photon")
				area.destroy("explosion")
			if area.type == "photon":
				#photoelectric effect
				if area.v.length() > 1000: 
					for e in floor(area.v.length()/1000):
						velocity += area.v*0.1
						if electrons > 0:
							emit("electron")
							electrons -= 1
				
				#interactions
				if group in ["alkali metal","halogen"]: onfire = true
				if protons == 21: $model/sc_glow.show()
				if protons == 58: $model/ce_flame.emitting = true
				if protons == 63: 
					$model/face/glasses.position.y = 0
					eu_glassesdown = true
				if protons == 66: $model/tail/dy_laser.show()
				if protons == 88 and mass == 223:
					$model/ra223_glow.show()
					$model/ra_glow.hide()
				elif protons == 88:
					$model/ra_glow.show()
					$model/ra223_glow.hide()
				if protons == 102: $model/tail/no_fuse.emitting = true
				
				#if one of the shiny fellas, reflect photons; otherwise absorb them
				if protons in [13,24,45,47,78,79]:
					if abs(area.position.x-position.x) < 16: area.v.y *= -1
					else: area.v.x *= -1
					$sparkle.play()
					flash()
				else:
					glob.particles -= 1
					area.queue_free()
					flash()
					velocity.y -= 1000 * glob.rate
				if protons != 25: $meow.play()

func _on_range_body_entered(body):
	if body != null and body != self and knocked_out <= 0:
		if body is tool:
			if glob.tool == 6: attractor = body
			if group != "noble gas" and glob.catto_ai == true:
				if glob.tool in [1,7] and protons > 1: disinterest = body
				if glob.tool == 8 and protons in [3,11,19,27,33,37]:
					match protons:
						3, 11, 19, 27, 37:
							if pet_num < pet_thresh:
								disinterest = body
							else:
								disinterest = null
						_: disinterest = body
				if glob.tool == 8 and protons == 27: 
					if pet_num < pet_thresh: eye1 = 2
				if [protons,mass] == [33,75] and glob.tool == 2: disinterest = body
				if glob.tool == 8 and protons in [60]: interest = body
		if body is particle and glob.catto_ai == true:
			if [protons,mass] == [33,75] and body.type == "neutron": disinterest = body
			if body.type == "electron" and electrons < protons: interest = body
		if body is element_catto and body.electrons-body.protons != 0 and electrons-protons != 0:
			attractor = body
		elif body is element_catto and group != "noble gas" and glob.catto_ai == true:
			look_x = clamp(body.position.x-position.x,-8,8)
			look_y = clamp(body.position.y-position.y,-8,4)
			
			nearby = body
			if electrons > 0 and body.electrons > 0:
				if protons < 119 and body.protons < 119 and body.protons != protons:
					if protons == 1 and body.protons in [0,1,6,8]:
						interest = body
					if protons == 26 and body.protons == 8:
						interest = null
						disinterest = body
						body.interest = self
					if body.protons == 33:
						if protons == 30: interest = body
						elif !(protons == 43 and body.mass == 72): disinterest = body
					if protons == 39 and body.protons == 77:
						disinterest = body
					if [protons,mass] == [42,94]:
						eye1 = 19
						eye2 = 19
					if protons == 47 and body.protons == 79:
						interest = body
						body.interest = self
					
					if mass == main_isotopes[protons] and body.mass == body.main_isotopes[body.protons]:
						if [protons,body.protons] in [[3,27],[11,17],[24,8],[24,64],[27,62],[35,80],[43,75],[45,46],[47,29],[63,64],[76,78],[83,8],[84,88],[97,117]]:
							interest = body
							body.interest = self
						if [protons,body.protons] in [[31,13],[33,30]]:
							disinterest = body
						if protons == 6 and body.protons in [1,7,8,14,26]:
							interest = body
							if body.protons == 14: body.interest = self
						if protons == 26 and body.protons == 30 and disinterest == null:
							interest = body
							body.interest = self
						if protons == 27 and body.protons == 62:
							interest = body
							body.interest = self
						if protons == 60 and body.protons in [26,27,28]:
							interest = body
							attractor = body
							body.interest = null
							body.disinterest = self
							body.attractor = self
						if protons == 110 and body.protons <= 118: 
							$model/face/facetext.text = "HI " + symbols[body.protons]
				else:
					if protons == 33:
						if mass == 75 and body.mass != 75: 
							disinterest = body
						if mass != 75 and body.mass == 75:
							body.disinterest = self
						if body.mass in [74,77]:
							disinterest = body
						if !(mass in [73,74,75,77]):
							interest = body
		if body is bungy and glob.catto_ai == true:
			if protons == 33: disinterest = body
			if protons == 43: interest = body
		if body is purrcent and $flash.modulate.a > 0.9: 
			body.spawn_catto(8,8,8)
			body.spawn_catto(7,7,7)
			body.spawn_catto(6,6,6)
			body.spawn_catto(1,0,1)
			body.destroy("poof")

func _on_range_body_exited(body):
	if body != null:
		if (body is element_catto or body is particle or body is tool) and body != self:
			nearby = null
			attractor = null
			interest = null
			disinterest = null
			if group != "noble gas": update()
			if [protons,mass] == [42,94]:
				eye1 = 0
				eye2 = 0

func _on_veryclose_body_entered(body):
	if body != null:
		if body is tool:
			if [protons,mass] == [33,75] and glob.tool == 2:
				$model/face/eye1.play("shut")
				$model/face/eye2.play("shut")
		if body is particle:
			if [protons,mass] == [33,75] and body.type == "neutron":
				$model/face/eye1.play("shut")
				$model/face/eye2.play("shut")

func _on_veryclose_body_exited(body):
	if body != null:
		if (body is element_catto or body is particle or body is tool) and body != self:
			if group != "noble gas": update()


func _on_pet_finished() -> void:
	petted = false

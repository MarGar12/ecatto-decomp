extends Area2D

class_name particle

var v = Vector2.ZERO
var color = [1,1,0]
var charge = -1
var anti = 1
var group = "fermion"
var type = "electron"
var halflife = INF
var decay = INF

var attractor = null
var repeller = null

var emit = 0.0
var dragged = false

# Called when the node enters the scene tree for the first anti.
func _ready():
	#glob.particles += 1
	if type != "neutron":
		v.x = randf_range(-300,300)
		v.y = randf_range(-300,300)
		v = v.normalized()*300
	if v.length() > 300: v /= 2.0


# Called every frame. 'delta' is the elapsed anti since the previous frame.
func _process(delta):
	#delete when resetting
	if Input.is_action_just_pressed("R"): 
		queue_free()
	
	if emit > 0: emit -= delta
	
	position += v * delta * glob.rate
	
	if glob.selected == self: $sprite.scale = Vector2.ONE*1.5
	else: $sprite.scale = Vector2.ONE
	$info.visible = glob.selected == self
	
	if type in ["up quark","down quark","antiup antiquark","antidown antiquark","electron","positron","neutrino","antineutrino"]: group = "fermion"
	if type in ["neutron","meson"]: group = "nucleon"
	if type in ["photon"]: group = "boson"
	
	if type == "up quark":
		color = [0,1,0]
		charge = 1
		anti = 0
		$desc.tooltip_text = "Up quarks are elementary particles found inside protons and neutrons.\nThese have a positive charge. Due to an effect called color confinement\nquarks cannot exist on their own for more than a miniscule fraction of a second."
	if type == "down quark":
		color = [0,1,1]
		charge = -1
		anti = 0
		$desc.tooltip_text = "Down quarks are elementary particles found inside protons and neutrons.\nThese have a negative charge. Due to an effect called color confinement\nquarks cannot exist on their own for more than a miniscule fraction of a second."
	if type == "electron":
		color = [1,1,0]
		charge = -1
		anti = 0
		$desc.tooltip_text = "Electrons are low-mass leptons with a negative electric charge.\nThey are one of the three types of elementary particles, together with\nup quarks and down quarks, that make up pretty much all visible matter in the Universe.\nFree electrons will scatter photons (change their direction)."
	if type == "positron":
		color = [1,0,0]
		charge = 1
		anti = 1
		$desc.tooltip_text = "Positrons are the antimatter counterpart to electrons.\nLike all antimatter, they are mostly created by decaying atoms.\nFree positrons will scatter photons (change their direction).\nIf a positron meets an electron, they will both become photons."
	if type == "neutrino":
		color = [1,1,1]
		charge = 0
		anti = 0
		$desc.tooltip_text = "Neutrinos are very light leptons with no electric charge.\nThey are usually created together with electrons or positrons in decaying atoms.\nDue to their extremely low mass, neutrinos almost never\ninteract with other matter and are therefore hard to detect."
	if type == "antineutrino":
		color = [1,1,1]
		charge = 0
		anti = 1
		$desc.tooltip_text = "Antineutrinos are the antimatter counterpart to neutrinos.\nLike neutrinos, they have no charge.\nIf an antineutrino meets a neutrino, they will both become photons."
	if type == "neutron":
		charge = 0
		halflife = 900
		$desc.tooltip_text = "Neutrons are particles found in the nucleus of an atom together with protons.\nThey have no charge and are composed of two down quarks and one up quark.\nOn their own neutrons are unstable with a half-life of about 15 minutes\nand become protons when they decay."
		if position.y < -15: v.y += glob.gravity*98.1*delta
		elif dragged == false:
			v.y = (-15-position.y)/delta
			v.x /= 1.1
	if type == "photon":
		color = [0,1,1]
		charge = 0
		anti = 0
		$desc.tooltip_text = "Photons are massless particles that make up electromagnetic radiation,\nwhich includes visible light, UV light, radio waves, etc.\nHigh-energy photons can knock electrons out of atoms -\nthis is called the photoelectric effect."
	
	if halflife != INF and glob.weakforce == true:
		if decay == INF: decay = tan(deg_to_rad(randf_range(0,90)))*halflife
		decay -= delta * glob.rate
		if decay <= 0:
			emit_new("electron")
			emit_new("antineutrino")
			proton()
	
	$neutron.visible = type == "neutron"
	$sprite.visible = group == "fermion"
	$boson.visible = group == "boson"
	
	$neutron/glow.visible = glob.weakforce
	
	$sprite.frame_coords.x = -charge+1
	$sprite.frame_coords.y = anti
	$info/name.text = type
	if type == "neutron" and glob.weakforce == true: $info/type.text = "decays in " + str(snapped(decay,0.1)) + "s"
	else: $info/type.text = group + ["-","","+"][charge+1]
	
	if glob.opaquewalls == true or type == "neutron":
		if abs(position.x) > glob.box_x: 
			position.x = glob.box_x*sign(position.x)
			v.x *= -1
		if position.y > 0: 
			if type == "neutron": position.y = -15
			else: position.y = 0
			v.y *= -1
		if position.y < (glob.box_y*-1)-2048: 
			position.y = (glob.box_y*-1)-2048
			v.y *= -1
	
	#dragging the particle
	if glob.selected == self and Input.is_action_pressed("lmb"):
		dragged = true
		glob.dragging = true
	if Input.is_action_just_released("lmb"):
		dragged = false
		glob.dragging = false
	if dragged == true: v = (get_global_mouse_position() - position)*10 / glob.rate
	if v.length() < 50 and group == "boson":
		v.x = randf_range(-300,300)
		v.y = randf_range(-300,300)
		v = v.normalized()*300
	
	$sprite.modulate.r = color[0]
	$sprite.modulate.g = color[1]
	$sprite.modulate.b = color[2]
	$boson.modulate = $sprite.modulate
	
	#lag prevention
	if glob.particles > 100 or position.length() > glob.box_x+10000:
		#glob.particles -= 1
		queue_free()
	
	#using tools
	if glob.selected == self and Input.is_action_just_pressed("lmb"):
		if glob.tool == 1 and type == "neutron":
			emit_new("electron")
			emit_new("antineutrino")
			proton()
		if glob.tool == 6:
			emit_new(type,true)
	if glob.selected == self and Input.is_action_pressed("lmb"):
		if glob.tool == 5 and type == "neutron":
			decay /= 1+delta*5
	if glob.tool == 7 and Input.is_action_pressed("lmb"):
		v += (get_global_mouse_position()-position).normalized()/(get_global_mouse_position()-position).length()*delta*100000
		if (get_global_mouse_position()-position).length() < 64: 
			#glob.particles -= 1
			queue_free()

func _on_mouse_entered():
	glob.selected = self
func _on_mouse_exited():
	glob.selected = null

func emit_new(prt,place_above = false):
	var scene = load("res://ec_assets/objects/particle.tscn")
	var instance = scene.instantiate()
	instance.position = position
	instance.type = prt
	instance.emit = 0.25
	if place_above == true: instance.position.y -= 100
	add_sibling(instance)

func proton():
	var scene = load("res://ec_assets/objects/element_catto.tscn")
	var instance = scene.instantiate()
	instance.position = position
	instance.protons = 1
	instance.neutrons = 0
	instance.electrons = 0
	add_sibling(instance)
	queue_free()

func _on_area_entered(area):
	if area != null and area != self:
		if area is particle and emit <= 0:
			if charge != 0 and area.charge == charge: 
				v += (position-area.position)*10
			if [type,area.type] in [["electron","positron"],["positron","electron"],["neutrino","antineutrino"],["antineutrino","neutrino"]]:
				v += area.v
				type = "photon"
				area.type = "photon"
				$annihilate.play()
				emit = 0.1
				area.emit = 0.1
			elif type in ["electron","positron"] and area.type == "photon":
				area.v = area.v.rotated(randf_range(0,PI*2))
				$annihilate.play()
			elif type == "photon" and area.type == type:
				v += area.v
				type = "electron"
				area.type = "positron"
				$annihilate.play()
				emit = 0.1
				area.emit = 0.1
			elif type == "neutron" and area.type == type:
				v = (position-area.position)*20
			else: pass
			emit = 0.1

func destroy(eff):
	#glob.particles -= 1
	var scene = load("res://ec_assets/objects/"+eff+".tscn")
	var instance = scene.instantiate()
	instance.position = position
	add_sibling(instance)
	queue_free()


func _on_tree_entered() -> void:
	glob.particles += 1


func _on_tree_exiting() -> void:
	glob.particles -= 1

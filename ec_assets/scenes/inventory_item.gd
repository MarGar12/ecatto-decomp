extends Area2D

var unlocked = true
var item = "proton"
var selected = false

# Called when the node enters the scene tree for the first time.
func _ready():
	item = name


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	$Label.text = str(get_index()) #debug stuff
	
	$hidden.visible = unlocked == false
	
	if $select.visible == true and Input.is_action_pressed("lmb") and glob.spawning == null: 
		glob.spawning = item
	if glob.spawning == item and Input.is_action_just_released("lmb"):
		if item == "proton": spawn_catto(1,0,0)
		elif item == "neutron": spawn_particle("neutron")
		elif item == "electron": spawn_particle("electron")
		elif item == "purrcent": spawn_object("purrcent")
		elif item == "bungy": spawn_object("bungy")
		elif glob.spawn_nucleus == true: spawn_catto(get_index()-6,get_index()-6,0)
		else: spawn_catto(get_index()-6,get_index()-6,get_index()-6)
		glob.spawning = null
	
	selected = $select.visible
	if selected == true and get_index()-6 > 36: $"..".descontop = true
	elif selected == true: $"..".descontop = false

func _on_mouse_entered():
	if unlocked == true: $select.show()
	var idiot = randi_range(0,999)
	if idiot == 0: $"..".sel_name = "idiot"
	else: $"..".sel_name = ""
func _on_mouse_exited():
	$select.hide()

func spawn_object(obj):
	var scene = load("res://ec_assets/objects/"+obj+".tscn")
	var instance = scene.instantiate()
	instance.global_position = get_global_mouse_position()
	get_tree().current_scene.add_child(instance)

func spawn_particle(type):
	var scene = load("res://ec_assets/objects/particle.tscn")
	var instance = scene.instantiate()
	instance.global_position = get_global_mouse_position()
	instance.type = type
	get_tree().current_scene.add_child(instance)

func spawn_catto(p,n,e):
	var scene = load("res://ec_assets/objects/element_catto.tscn")
	var instance = scene.instantiate()
	instance.global_position = get_global_mouse_position()
	instance.protons = p
	instance.neutrons = n
	instance.electrons = e
	if instance.protons == 0 and glob.spawn_nucleus == false: instance.electrons = 1
	if instance.protons == 1: instance.neutrons = 0
	instance.player_spawned = true
	get_tree().current_scene.add_child(instance)

func _on_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton: glob.inv_open = false
	glob.dragging = true

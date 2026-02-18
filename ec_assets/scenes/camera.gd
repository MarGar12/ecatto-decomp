extends Camera2D

var spawn_sel = 0

var presets = ["None","Standard","The Moon","Deep Space","Sun Core"]
var preset = 0

var touches = {} # : {int: Vec2}
func _unhandled_input(event):
	if event is InputEventMouseMotion and (((Input.is_action_pressed("mmb") or Input.is_action_pressed("rmb")) and !glob.pause) or (Input.is_action_pressed("lmb") and !glob.dragging and !glob.tool and glob.lcdrag == true and !glob.pause)):
		position.x -= event.relative.x/zoom.x
		position.y -= event.relative.y/zoom.x
		
func _input(event):
	if event is InputEventScreenTouch:
		if event.pressed:
			touches[event.index] = event.position
			if not touches.is_empty():
				glob.dragging = false
				for catto in get_tree().current_scene.find_child("catto").get_children():
					catto.dragged = false
					if catto.find_child("model"):
						catto.find_child("model").find_child("anim").play("idle")
		else:
			touches.erase(event.index)
	if (event is InputEventScreenDrag and not glob.dragging and not glob.inv_open and not glob.pause and not glob.tool):
		if touches.size() > 1:
			var mean = Vector2.ZERO
			for p in touches.values():
				mean += p
				mean /= touches.size()
			var tdist = 0.0
			for p in touches.values():
				tdist += (mean - p).length()
			var newtdist = 0.0
			for i in touches.keys():
				if i == event.index:
					newtdist += (mean - event.position).length()
				else: newtdist += (mean - touches[i]).length()
			zoom *= newtdist / tdist
			if zoom.x < 0.1: zoom = 0.1 * Vector2.ONE
			if zoom.x > 10: zoom = 10 * Vector2.ONE
		position -= event.relative / zoom.x / touches.size()
	if event is InputEventScreenDrag: touches[event.index] = event.position

# Called when the node enters the scene tree for the first time.
func _ready():
	glob.camera = self
	$ui/topright.scale = Vector2.ONE*0.75
	$ui/center/inventory/nucleus.button_pressed = glob.spawn_nucleus
	$ui/topright/presslider.value = glob.pressure
	$ui/topright/gravslider.value = glob.gravity/9.81
	sync_settings()
	# transparent test
	#get_tree().get_root().set_transparent_background(true)
	#DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_TRANSPARENT, true, 0)

func sync_settings():
	$ui/pause/tab/Gameplay/explode.button_pressed = glob.explosions
	$ui/pause/tab/Gameplay/opaque.button_pressed = glob.opaquewalls
	$ui/pause/tab/Audio/mvol.value = glob.music_volume
	$ui/pause/tab/Audio/svol.value = glob.sfx_volume
	$ui/pause/tab/Gameplay/temp.value = glob.t_speed
	$ui/pause/tab/Gameplay/fusethres.value = glob.fusion_threshold
	$ui/pause/tab/Gameplay/poof.button_pressed = glob.poof
	$ui/pause/tab/Gameplay/weak.button_pressed = glob.weakforce
	$ui/pause/tab/Gameplay/endworld.button_pressed = glob.endable_world
	$ui/pause/tab/Video/scale.button_pressed = glob.hudscaling
	$ui/pause/tab/Gameplay/drag.button_pressed = glob.lcdrag
	$ui/pause/tab/Gameplay/ai.button_pressed = glob.catto_ai
	$ui/pause/tab/Gameplay/rotate.button_pressed = glob.catto_rotat
	$ui/pause/tab/Video/hudtrans.value = glob.hudparency

func spawn_electron_toy():
	var electron_toy = load("res://ec_assets/objects/fake_electron_ball.tscn")
	var toy_instance = electron_toy.instantiate()
	toy_instance.position = get_global_mouse_position()
	add_sibling.call_deferred(toy_instance)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("wheelup") and zoom.x < 10 and !glob.pause: zoom *= 1.1
	if Input.is_action_just_pressed("wheeldown") and zoom.x > 0.1 and !glob.pause: zoom /= 1.1
	
	
	if get_window().size.x <= 1010 && glob.hudscaling == false :
		$ui/topright.position.y = 64
	else:
		$ui/topright.position.y = 0
	# Change camera scale based on window size -- from ec+
	var smult = min(get_window().size.x / 1024.0, get_window().size.y / 768.0)
	$ui/pause.scale = (Vector2.ONE*2) * smult
	if glob.hudscaling == true:
		$ui/topleft.scale = (Vector2.ONE*2) * smult
		$ui/topright.scale = (Vector2.ONE*2) * smult
		$ui/center.scale = (Vector2.ONE*2) * smult
		$ui/botleft.scale = (Vector2.ONE*2) * smult
		$ui/botright.scale = (Vector2.ONE*2) * smult
	else:
		$ui/topleft.scale = (Vector2.ONE*2)
		$ui/topright.scale = (Vector2.ONE*2)
		$ui/center.scale = (Vector2.ONE*2)
		$ui/botleft.scale = (Vector2.ONE*2)
		$ui/botright.scale = (Vector2.ONE*2)
		
	$ui/topleft.modulate = Color(1,1,1,glob.hudparency)
	$ui/topright.modulate = Color(1,1,1,glob.hudparency)
	$ui/center.modulate = Color(1,1,1,glob.hudparency)
	$ui/botleft.modulate = Color(1,1,1,glob.hudparency)
	$ui/botright.modulate = Color(1,1,1,glob.hudparency)
	
	$ui/topright/rate.text = "Time Rate: " + str(glob.rate)
	#if glob.temperature < 100000:
	$ui/topright/temp.text = "T=" + str(snapped(glob.temperature,0.01)) + "°K (" + str(snapped(glob.temperature-273.15,0.01)) + "°C)"
	#else:
	#	$ui/topright/temp.text = "T=1e" + str(snapped(glob.t_power+2.5,0.1)) + "K"
	$ui/topright/pres.text = "Air Pressure: " + str(snapped(glob.pressure,0.01)) + " bar"
	$ui/topright/grav.text = "Gravity: " + str(snapped(glob.gravity/9.81,0.01)) + "g"

	$ui/topleft/cattocount.text = str(glob.cattos)
	$ui/topleft/particlecount.text = str(glob.particles)
	
	if not Input.is_action_pressed("lmb"): $ui/topright/tempslider.value = 0
	glob.t_power += $ui/topright/tempslider.value * delta / 200.0 * glob.t_speed
	glob.temperature = 293.15*pow(10,glob.t_power)
	
	if Input.is_action_just_pressed("space") and !glob.pause:
		glob.inv_open = !glob.inv_open
	$ui/center/inventory.visible = glob.inv_open and !glob.pause
	
	if Input.is_action_just_pressed("R"):
		glob.cattos = 0
		glob.particles = 0
	
	$spawning.global_position = get_global_mouse_position()
	$spawning.visible = glob.spawning != null
	
	$ui/topleft.visible = !glob.inv_open and !glob.pause
	$ui/topright.visible = !glob.inv_open and !glob.pause
	$ui/botleft.visible = !glob.inv_open and !glob.pause
	$ui/botright.visible = !glob.inv_open and !glob.pause
	
	$tool.global_position = get_global_mouse_position()
	$tool.visible = glob.tool != 0
	$tool/hammer.visible = glob.tool == 1
	$tool/tweezers.visible = glob.tool == 2
	$tool/emagnet.visible = glob.tool == 3
	$tool/lightbulb.visible = glob.tool == 4
	$tool/weakray.visible = glob.tool == 5
	$tool/cloner.visible = glob.tool == 6
	$tool/blackhole.visible = glob.tool == 7
	if Input.is_action_just_pressed("lmb"): 
		$tool/anim.play("RESET")
		$tool/anim.play("use")
		if glob.tool == 1: $tool/hammernoise.play()
		if glob.tool == 4: spawn_particle("photon")
		if glob.tool == 9: spawn_electron_toy()
	if Input.is_action_just_pressed("rmb"): glob.tool = 0
	
	if Input.is_action_just_pressed("esc"): 
		glob.pause = !glob.pause
		get_tree().paused = glob.pause
		glob.save()
	
	$ui/pause.visible = glob.pause
	$ui/pause/tab/Audio/mvol/value.text = "Music Volume: " + str(glob.music_volume * 100).pad_decimals(0) + "%"
	$ui/pause/tab/Audio/svol/value.text = "Sound volume: " + str(glob.sfx_volume * 100).pad_decimals(0) + "%"
	$ui/pause/tab/Gameplay/temp/value.text = "Temperature Slider Speed: " + str(glob.t_speed)
	if glob.fusion_threshold < 3:
		$ui/pause/tab/Gameplay/fusethres/value.text = "Fusion Threshold: " + str(glob.fusion_threshold)
	else:
		$ui/pause/tab/Gameplay/fusethres/value.text = "No Fusion"
	$ui/pause/tab/Gameplay/endworld.disabled = !glob.earth_exploded
	$ui/pause/tab/Video/hudtrans/value.text = "HUD Transparency: " + str(glob.hudparency * 100).pad_decimals(0) + "%"

func _on_rateslider_value_changed(value):
	glob.rate = pow(10,value)
func _on_presslider_value_changed(value):
	glob.pressure = value
func _on_gravslider_value_changed(value):
	glob.gravity = value*9.81

#settings
func _on_explosions_toggled(button_pressed):
	glob.explosions = button_pressed
func _on_mus_volume_value_changed(value):
	glob.music_volume = value
func _on_sfx_volume_value_changed(value):
	glob.sfx_volume = value
func _on_t_speed_value_changed(value):
	glob.t_speed = value
func _on_fus_thres_value_changed(value):
	glob.fusion_threshold = value
func _on_gaspoof_toggled(button_pressed):
	glob.poof = button_pressed
func _on_weakforce_toggled(button_pressed):
	glob.weakforce = button_pressed
func _on_end_world_toggled(button_pressed):
	glob.endable_world = button_pressed
func _on_hud_scale_toggled(button_pressed):
	glob.hudscaling = button_pressed
func _on_lcdrag_toggled(button_pressed):
	glob.lcdrag = button_pressed
func _on_catto_ai_toggled(button_pressed):
	glob.catto_ai = button_pressed
func _on_rotat_toggled(button_pressed):
	glob.catto_rotat = button_pressed
func _on_hudtrans_value_changed(value):
	glob.hudparency = value

func _on_nucleus_toggled(button_pressed):
	glob.spawn_nucleus = button_pressed

func _on_hammer_pressed():
	if glob.tool == 1: glob.tool = 0
	else: glob.tool = 1
func _on_tweezers_pressed():
	if glob.tool == 2: glob.tool = 0
	else: glob.tool = 2
func _on_emagnet_pressed():
	if glob.tool == 3: glob.tool = 0
	else: glob.tool = 3
func _on_flashlight_pressed():
	if glob.tool == 4: glob.tool = 0
	else: glob.tool = 4
func _on_weakray_pressed():
	if glob.tool == 5: glob.tool = 0
	else: glob.tool = 5
func _on_clone_pressed():
	if glob.tool == 6: glob.tool = 0
	else: glob.tool = 6
func _on_blackhole_pressed():
	if glob.tool == 7: glob.tool = 0
	else: glob.tool = 7
func _on_pet_pressed():
	if glob.tool == 8: glob.tool = 0
	else: glob.tool = 8
func _on_electron_toy_pressed():
	if glob.tool == 9: glob.tool = 0
	else: glob.tool = 9

func _on_elementpicker_pressed():
	glob.inv_open = true
func _on_pause_pressed(): # pause button
	glob.pause = !glob.pause
	get_tree().paused = glob.pause
func _on_reset_button_pressed(): # reset button
	get_tree().reload_current_scene()
	preset = 1
	glob.t_power = 0
	glob.pressure = 1
	glob.gravity = 9.81
	$ui/topright/presslider.value = glob.pressure
	$ui/topright/gravslider.value = glob.gravity/9.81

func _on_anim_animation_finished(_anim_name):
	$tool/anim.play("idle")

func _on_preset_item_selected(index):
	preset = index
	if preset == 0:
		$"../walls/opaque".self_modulate = Color(0.62,0.62,0.62,1)
	if preset == 1:
		glob.t_power = 0
		glob.pressure = 1
		glob.gravity = 9.81
		$"../walls/opaque".self_modulate = Color(0.62,0.62,0.62,0.15)
	if preset == 2:
		glob.t_power = 0
		glob.pressure = 0
		glob.gravity = 1.62
		$"../walls/opaque".self_modulate = Color(0.62,0.62,0.62,0.15)
	if preset == 3:
		glob.t_power = -2.03
		glob.pressure = 0
		glob.gravity = 0
		$"../walls/opaque".self_modulate = Color(0.62,0.62,0.62,0.15)
	if preset == 4:
		glob.t_power = 5
		glob.pressure = 5
		glob.gravity = 0
		$"../walls/opaque".self_modulate = Color(0.62,0.62,0.62,0.15)
	
	$ui/topright/presslider.value = glob.pressure
	$ui/topright/gravslider.value = glob.gravity/9.81

func _on_reset_pressed():
	if preset == 1:
		glob.t_power = 0
		glob.pressure = 1
		glob.gravity = 9.81
	if preset == 2:
		glob.t_power = 0
		glob.pressure = 0
		glob.gravity = 1.62
	if preset == 3:
		glob.t_power = -2.03
		glob.pressure = 0
		glob.gravity = 0
	if preset == 4:
		glob.t_power = 5
		glob.pressure = 5
		glob.gravity = 0
	
	$ui/topright/presslider.value = glob.pressure
	$ui/topright/gravslider.value = glob.gravity/9.81

func _on_button_hover():
	$ui/topleft/tooldesc.show()
func _on_button_unhover():
	$ui/topleft/tooldesc.hide()

func _on_hammer_mouse_entered():
	$ui/topleft/tooldesc.text = "Fission Hammer\nSplits an element's mass in half."
func _on_tweezers_mouse_entered():
	$ui/topleft/tooldesc.text = "Tweezers\nRemoves one neutron."
func _on_emagnet_mouse_entered():
	$ui/topleft/tooldesc.text = "Electromagnet\nRemoves one electron."
func _on_flashlight_mouse_entered():
	$ui/topleft/tooldesc.text = "Light Bulb\nCreates photons."
func _on_weakray_mouse_entered():
	$ui/topleft/tooldesc.text = "Weak Ray\nVastly accelerates nuclear decay."
func _on_clone_mouse_entered():
	$ui/topleft/tooldesc.text = "Matter Duplicator\nViolates the law of conservation of mass."
func _on_blackhole_mouse_entered():
	$ui/topleft/tooldesc.text = "Black Hole\nDestroys matter."
func _on_elementpicker_mouse_entered():
	$ui/topleft/tooldesc.text = "Purriodic Table\nSpawn element cattos!"
func _on_pet_mouse_entered():
	$ui/topleft/tooldesc.text = "Pet Cattos\nPet pet pet..."
func _on_electrontoy_mouse_entered():
	$ui/topleft/tooldesc.text = "Fake Electron Ball\nSpawns a fake electron toy the cattos can play with."

func _on_quit_pressed():
	get_tree().paused = false
	glob.pause = false
	glob.inv_open = false
	glob.save()
	get_tree().change_scene_to_file("res://ec_assets/scenes/menu.tscn")

func _on_quit_mouse_entered():
	$ui/botleft/quit_hint.show()
func _on_quit_mouse_exited():
	$ui/botleft/quit_hint.hide()
func _on_pause_mouse_entered():
	$ui/botleft/pause_hint.show()
func _on_pause_mouse_exited():
	$ui/botleft/pause_hint.hide()
func _on_reset_button_mouse_entered():
	$ui/botleft/reset_hint.show()
func _on_reset_button_mouse_exited():
	$ui/botleft/reset_hint.hide()

func _on_back_pressed():
	get_tree().paused = false
	glob.pause = false
	glob.inv_open = false
	glob.save()

func _on_help_pressed():
	glob.tutorial = true

func reset_conditions():
	reset_settings()
	sync_settings()
	preset = 1
	glob.t_power = 0
	glob.pressure = 1
	glob.gravity = 9.81
	$ui/topright/presslider.value = glob.pressure
	$ui/topright/gravslider.value = glob.gravity/9.81

func reset_settings():
	glob.explosions = true
	glob.opaquewalls = false
	glob.music_volume = 1.0
	glob.sfx_volume = 1.0
	glob.t_speed = 1.0
	glob.fusion_threshold = 1.0
	glob.poof = true
	glob.weakforce = true
	glob.endable_world = true
	glob.catto_ai = true
	glob.catto_rotat = true
	glob.hudscaling = true

func _on_settings_reset_pressed():
	reset_settings()
	sync_settings()

func _on_opaquewalls_toggled(button_pressed):
	glob.opaquewalls = button_pressed

func spawn_particle(type):
	var scene = load("res://ec_assets/objects/particle.tscn")
	var instance = scene.instantiate()
	instance.type = type
	instance.position = get_global_mouse_position()
	add_sibling(instance)

extends CharacterBody2D

class_name purrcent

var density = 1000
var boiltemp = 273.15+150
var melttemp = 273.15+50

var state = "solid"

var irradiated = false
var halflife = INF

var dragged = false
var noise = 0
var noisetimer = 0.0

var speed = 1.0
var look_x = 0.0
var look_y = 0.0
var looktimer = 5.0
var lookspeed = 1.0
var movetimer = 10.0

func _ready():
	$model/select.hide()
	$info.hide()
	flash()
	movetimer = randf_range(0,10)
	var tween: Tween = create_tween()
	tween.tween_property($flash, "modulate", Color(1,1,1,0), 0.25)

func _physics_process(delta):
	#delete when resetting
	if Input.is_action_just_pressed("R"): queue_free()
	
	#gravity
	if not is_on_floor():
		velocity.y += glob.gravity*100 * delta * glob.rate
	velocity.y = clamp(velocity.y,-1.0/glob.pressure*1000,5000)
	if is_on_floor() or is_on_ceiling():
		velocity.x /= 1+delta*10

	move_and_slide()
	
	density = 1000.0 / pow(glob.temperature/293.15,0.1)
	
	#states of cat
	if glob.temperature > boiltemp: 
		state = "gas"
		$gas.emitting = true
		$drip.emitting = false
	elif glob.temperature > melttemp:
		state = "liquid"
		$gas.emitting = false
		$drip.emitting = true
		$drip.gravity.y = glob.gravity*10
	else: 
		state = "solid"
		$gas.emitting = false
		$drip.emitting = false
	
	#space suit
	$model/spacesuit.visible = glob.air_density < 0.8
	if $model/spacesuit.visible == true: $model/tail.modulate.v = 1
	else: $model/tail.modulate.v = 0
	
	#radioactivity
	$radiation.emitting = irradiated
	$radiation.modulate.a = clamp(5.0/sqrt(halflife),0,10)
	if irradiated == true and $geiger.playing == false: $geiger.play(randf_range(0,0.2))
	if halflife > pow(10,16): $geiger.volume_db = -10
	else: $geiger.volume_db = 0
	if glob.weakforce == false: irradiated = false
	$model/face/eye3.visible = irradiated
	$model/face/pupils/pupil3.visible = irradiated
	
	#dragging the catto
	if glob.selected == self and Input.is_action_pressed("lmb"):
		dragged = true
		glob.dragging = true
	if Input.is_action_just_released("lmb"):
		dragged = false
		glob.dragging = false
	
	if dragged == true and Input.is_action_pressed("lmb"):
		velocity = (get_global_mouse_position() - position) * 5
		$model/anim.play("grabbed")
	else: $model/anim.play("idle")
	
	#squishy fluid
	if glob.temperature > melttemp-200 and !is_on_ceiling():
		scale.y = move_toward(scale.y,1+velocity.y/2000.0,scale.y*delta*10)
		scale.x = 2-scale.y
		skew = clamp(-velocity.x/2000.0,-1,1) * sign(velocity.y)
	else: 
		scale = Vector2.ONE
		skew /= 1+delta*5
	scale.x = clamp(scale.x,0.5,2)
	scale.y = clamp(scale.y,0.25,2)
	
	#rotation
	if glob.catto_rotat == true:
		if state == "solid" and glob.temperature <= melttemp-200 and dragged == true: 
			rotation_degrees += velocity.x*0.5*delta
			rotation /= 1+delta*glob.gravity
		elif abs(rotation_degrees) < 30 or velocity.y < 0: rotation /= 1+delta*3*glob.gravity
		elif abs(rotation_degrees) < 120: rotation_degrees += (sign(rotation)*60-rotation_degrees)*delta*3*glob.gravity
		else: rotation_degrees += (sign(rotation)*180-rotation_degrees)*delta*3*glob.gravity
		if glob.gravity < 0.5: rotation_degrees += velocity.x*0.5*delta
	elif dragged == true:
		if Input.is_action_pressed("Q"): rotation -= delta*2
		if Input.is_action_pressed("E"): rotation += delta*2
	
	$heat.advance((glob.temperature-300)/1000.0-$heat.current_animation_position)
	
	$model/select.visible = glob.selected == self
	$info.visible = $model/select.visible
	$info.rotation = -rotation
	
	$info/type.text = "cat (" + state + ")"
	$info/density.text = "density: " + str(snapped(density,0.01)) + " kg/m^3"
	
	#looking around
	looktimer -= delta
	if looktimer <= 0:
		look_x = randf_range(-8,8)
		look_y = randf_range(-8,4)
		looktimer = randf_range(1,7)
		$model/face/anim.speed_scale = randf_range(0.5,1.5)
	if (get_global_mouse_position()-position).length() < 100:
		look_x = (get_global_mouse_position().x-position.x)/8.0
		look_y = (get_global_mouse_position().y-position.y)/16.0
	if $model/spacesuit.visible == false: lookspeed = glob.temperature/273.15
	else: lookspeed = 1.0
	$model/face.position.x = move_toward($model/face.position.x,look_x,abs(look_x-$model/face.position.x)*delta*10*lookspeed)
	$model/face.position.y = move_toward($model/face.position.y,look_y-12,abs(look_y-12-$model/face.position.y)*delta*10*lookspeed)
	
	#movement
	if glob.catto_ai == true:
		speed = clamp(sqrt(glob.temperature/293.15),0,5) * glob.rate
		
		movetimer -= delta * speed
		if movetimer <= 0:
			if state == "gas":
				velocity = Vector2(look_x,look_y)*20 * speed
			elif is_on_floor():
				velocity.x = look_x*20 * speed
				velocity.y -= 500 * glob.rate
				$jump.play()
			movetimer = randf_range(0,10)
	
	#sounds
	if abs(velocity.y) > 50:
		noise = 1
	if (is_on_floor() or is_on_ceiling()) and noise > 0 and noisetimer <= 0:
		if state == "solid":
			$clank1.pitch_scale = 1.5+abs(velocity.y)/500.0
			$clank1.play(0.05)
		if state == "liquid":
			$splash.pitch_scale = clamp(abs(velocity.y)/100.0,0.5,4)
			$splash.play(0.05)
		if state == "gas": 
			$poof.play(0.05)
		noise = 0
		noisetimer = randf_range(0,0.5)
	if noisetimer > 0: noisetimer -= delta
	
	#using tools
	if glob.selected == self and Input.is_action_just_pressed("lmb"):
		if glob.tool == 1: 
			spawn_catto(8,8,8)
			spawn_catto(7,7,7)
			spawn_catto(6,6,6)
			spawn_catto(1,0,1)
			destroy("explosion")
		if glob.tool == 6:
			var newpur = duplicate()
			newpur.position = position + Vector2(0,-128)
			add_sibling(newpur)
	if glob.tool == 7 and Input.is_action_pressed("lmb"):
		velocity += (get_global_mouse_position()-position).normalized()/(get_global_mouse_position()-position).length()*delta*100000
		if (get_global_mouse_position()-position).length() < 64: destroy("poof")

func _on_mouse_entered():
	glob.selected = self
func _on_mouse_exited():
	glob.selected = null

func flash():
	$flash.modulate.a = 1
	$spawn.play()

func destroy(eff):
	var scene = load("res://ec_assets/objects/"+eff+".tscn")
	var instance = scene.instantiate()
	instance.position = position
	if instance.name == "poof": instance.color = $gas.color
	add_sibling(instance)
	queue_free()

func spawn_catto(p,n,e):
	var scene = load("res://ec_assets/objects/element_catto.tscn")
	var instance = scene.instantiate()
	instance.position.x = position.x
	instance.position.y = position.y-100
	instance.velocity.x = [-200,200].pick_random()
	instance.velocity.y = -300
	instance.protons = p
	instance.neutrons = n
	instance.electrons = e
	if instance.protons == 0: instance.electrons = 1
	if instance.protons == 1: instance.neutrons = 0
	add_sibling(instance)

func sponchsplosion():
	spawn_catto(1,0,1)
	spawn_catto(6,6,6)
	spawn_catto(7,7,7)
	spawn_catto(8,8,8)
	spawn_catto(15,16,15)
	spawn_catto(16,16,16)
	queue_free()

func _on_range_body_entered(body):
	if body != null:
		if body is element_catto:
			look_x = clamp(body.position.x-position.x,-8,8)
			look_y = clamp(body.position.y-position.y,-8,4)
			if body.halflife < pow(10,18) and glob.weakforce == true:
				if irradiated == false: $pop.play()
				irradiated = true
				if body.halflife < halflife: halflife = body.halflife

func _on_area_entered(area):
	if area != null:
		if area is particle:
			if area.type == "photon":
				#glob.particles -= 1
				area.queue_free()
				$spawn.play()
			if area.type == "positron":
				area.destroy("explosion")


func _on_tree_entered() -> void:
	glob.cattos += 1
	
func _on_tree_exiting() -> void:
	glob.cattos -= 1

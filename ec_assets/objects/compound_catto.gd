extends CharacterBody2D

class_name compound_catto

var compounds = ["Water"]
var formulas = ["H₂O"]
var mt = [0.0]
var bt = [100.0]
var type = "covalent"
var group = "base/acid"
var atoms = 3
var mass = 18
var density = 1000.0
var boiltemp = 373.15
var melttemp = 273.15

var state = "liquid"
var valence = 1

var eye1 = 0
var eye2 = 0
var mouth = 0
var spot = 0
var pupil1 = 0
var pupil2 = 0
var glasses = 0

var rad_color = [0.25,0.5,1]

var dragged = false
var noise = 0
var noisetimer = 0.0

var look_x = 0.0
var look_y = 0.0
var looktimer = 5.0
var movetimer = 10.0
var attractor = null
var repeller = null
var magnet = null

var expression = "normal"
var knocked_out = 0.0

var cloud = false

var onfire = false

var id = randf_range(0,1000)

var pet_thresh = 0
func _ready():
	update()

func _physics_process(delta):
	if Input.is_action_just_pressed("R"):
		queue_free()
	
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
	if state == "liquid": $model/face/eye1.position.y /= 1+delta*2
	else: $model/face/eye1.position.y += (-4-$model/face/eye1.position.y)*delta*2
	$model/face/pupils/pupil1.position.y = $model/face/eye1.position.y+4
	if glob.pressure == 0: boiltemp = melttemp
	else: boiltemp = 373.15
	
	#info
	$info.visible = $model/select.visible
	$info.rotation = -rotation
	#gravity
	if !is_on_floor(): velocity.y += glob.gravity*100 * delta
	if density < 1.3 and state == "gas": velocity.y -= (glob.air_density/density)*glob.pressure*glob.gravity*100 * delta
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
	if $model/select.visible and Input.is_action_pressed("lmb"):
		dragged = true
		glob.dragging = true
		$model/anim.play("grabbed")
	if Input.is_action_just_released("lmb"):
		dragged = false
		glob.dragging = false
		$model/anim.play("idle")
	
	if dragged == true and Input.is_action_pressed("lmb"):
		velocity = (get_global_mouse_position() - position) * 5
		
	var speed = clamp(sqrt(glob.temperature/293.15),0,5)
	
	#looking around
	if knocked_out <= 0:
		$model/face/anim.play("blink")
		looktimer -= delta * speed
		if attractor == null and repeller == null:
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
		elif attractor != null:
			look_x = clamp(attractor.position.x-position.x,-8,8)
			look_y = clamp(attractor.position.y-position.y,-8,4)
		elif repeller != null:
			look_x = -clamp(repeller.global_position.x-global_position.x,-8,8)
			look_y = -clamp(repeller.global_position.y-global_position.y,-8,4)
		$model/face.position.x = move_toward($model/face.position.x,look_x,abs(look_x-$model/face.position.x)*delta*10*glob.temperature/273.15)
		$model/face.position.y = move_toward($model/face.position.y,look_y+24,abs(look_y+24-$model/face.position.y)*delta*10*glob.temperature/273.15)
		$model/face/spot.position.x = -$model/face.position.x/2.0
		$model/face/spot.position.y = -$model/face.position.y/2.0+8
		$model/face/pupils.position.x = look_x/3.0
		$model/face/pupils.position.y = look_y/6.0-4
	
	#facial expressions
	if knocked_out > 0: knocked_out -= delta
	if knocked_out < 0: 
		update()
		knocked_out = 0
	if knocked_out > 1.0: $model/face/eye1.play("shut")
	
	#movement
	if glob.catto_ai == true and knocked_out <= 0:
		if attractor != null or repeller != null: 
			if state in ["liquid","gas"]: movetimer -= delta * 10 * speed
			else: movetimer -= delta * 100 * speed
		else: movetimer -= delta * speed
		if movetimer <= 0:
			if state == "gas":
				velocity = Vector2(look_x,look_y)*20 * speed
			elif is_on_floor():
				velocity.x = look_x*20 * speed
				velocity.y -= 500
			movetimer = randf_range(1,10)
		if magnet != null:
			velocity.x -= cos((position-magnet.position).angle()) * 20000/position.distance_squared_to(magnet.position)
			velocity.y -= sin((position-magnet.position).angle()) * 20000/position.distance_squared_to(magnet.position)
	
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
	
	#being on fire
	$model/fire.emitting = onfire
	
	#sounds
	if abs(velocity.y) > 50:
		noise = 1
	if abs(velocity.y) > 250:
		noise = 2
	if abs(velocity.y) > 1000:
		noise = 3
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

func update():
	#gas & drip colors
	$gas.color = $model/body.sprite_frames.get_frame_texture($model/body.animation,$model/body.frame).get_image().get_pixel(64,84)
	$drip.color = $gas.color

func _on_mouse_entered():
	$model/select.show()
func _on_mouse_exited():
	$model/select.hide()


func flash():
	$flash.modulate.a = 1
	$spawn.play()

func destroy(eff):
	glob.cattos -= 1
	var scene = load("res://ec_assets/objects/"+eff+".tscn")
	var instance = scene.instantiate()
	instance.position = position
	if instance.name == "poof": instance.color = $gas.color
	add_sibling(instance)
	queue_free()

func poof():
	velocity = Vector2.ZERO
	var scene = load("res://ec_assets/objects/poof.tscn")
	var instance = scene.instantiate()
	instance.position = position
	instance.color = $gas.color
	add_sibling(instance)

func _on_range_body_entered(_body):
	pass # Replace with function body.

func _on_range_body_exited(_body):
	pass # Replace with function body.

func _on_area_entered(_area):
	pass # Replace with function body.

func _on_body_entered(body):
	#glob.selected == self
	if body != null:
		if body is element_catto:
			if group == "base/acid" and body.group == "alkali metal": body.destroy("explosion")

func _on_body_exited(_body):
	pass # Replace with function body.


func _on_area_2d_body_entered(_body: Node2D) -> void:
	pass # Replace with function body.

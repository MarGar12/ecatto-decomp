extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_animation_player_animation_finished(_anim_name):
	glob.earth_exploded = true
	glob.t_power = 0
	glob.pressure = 1
	glob.gravity = 9.81
	get_tree().change_scene_to_file("res://ec_assets/scenes/main.tscn")

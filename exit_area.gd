extends Node3D

@onready var prompt_label: Label = $"../psx effect/exit_ntf"
@onready var gohome_label: Label = $"../psx effect/go_home_ntf"

var player_inside = false

var canhome = false

	
func _ready() -> void:
	prompt_label.visible = false
	gohome_label.visible = false

func _on_exit_area_body_entered(body: Node3D) -> void:
	if body.name == "PlayerCharacter" && not canhome:
		player_inside = true
		prompt_label.visible = true 
	elif  body.name == "PlayerCharacter" && canhome == true:
		player_inside = true
		gohome_label.visible = true 
		

func _on_exit_area_body_exited(body: Node3D) -> void:
	if body.name == "PlayerCharacter":
		player_inside = false
		prompt_label.visible = false

func _input(event):
	if player_inside and event.is_action_pressed("interact") and canhome:
		SceneTransition.change_scene("res://scenes/scene2.tscn")

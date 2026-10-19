extends Node3D


@export var target: Node3D
@onready var prompt_label: Label = $"../psx effect/talk_ntf"

var is_dialogue_active: bool = false

var player_inside = false

var talk = 1

func _ready():
	DialogueManager.dialogue_started.connect(_on_dialogue_started)
	DialogueManager.dialogue_ended.connect(_on_dialogue_ended)
	prompt_label.visible = false

func _on_dialogue_started(_resource) -> void:
	is_dialogue_active = true
func _on_dialogue_ended(_resource) -> void:
	is_dialogue_active = false
	target.walk_speed = 7.0
	talk += 1



func _process(delta: float) -> void:
	if talk == 3:
		prompt_label.visible = false
	print(talk)


func _on_area_3d_body_entered(body: Node3D) -> void:
	if body == target && talk < 3:
		player_inside = true
		prompt_label.visible = true 

func _on_area_3d_body_exited(body: Node3D) -> void:
	if body == target:
		player_inside = false
		prompt_label.visible = false

		
func _input(event):
	if player_inside and event.is_action_pressed("interact") && talk == 1:
		if is_dialogue_active:
			return
		var resource = load("res://1.dialogue")
		DialogueManager.show_dialogue_balloon(resource, "start")
		target.walk_speed = 0
		
		
	if player_inside and event.is_action_pressed("interact") && talk == 2:
		if is_dialogue_active:
			return
		var resource = load("res://2.dialogue")
		DialogueManager.show_dialogue_balloon(resource, "start")
		target.walk_speed = 0

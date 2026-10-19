extends Area3D

var triggered = false
@onready var prompt_label: Label = $"../psx effect/call_trigger_ntf"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node3D) -> void:
	if body.name == "PlayerCharacter" && not triggered:
		prompt_label.visible = true 
		


func _on_body_exited(body: Node3D) -> void:
	if body.name == "PlayerCharacter":
		prompt_label.visible = false
		triggered = true

extends Node3D

@export var speed = 30.0
@export var travel_distance = 300.0  # на какое расстояние уезжает, прежде чем вернуться

var start_position: Vector3

func _ready():
	start_position = position  # запоминаем стартовую точку

func _process(delta):
	# Двигаем вперёд (по -Z)
	position += Vector3(1, 0, 0) * speed * delta

	# Проверяем, проехали ли нужное расстояние
	if start_position.distance_to(position) >= travel_distance:
		position = start_position

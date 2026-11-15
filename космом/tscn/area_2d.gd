extends Area2D

@export var player: CharacterBody2D
@export var pickup_distance = 100.0

func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			var distance = player.global_position.distance_to(global_position)
			if distance <= pickup_distance:
				print("Предмет підібрано!")
				queue_free()
			else:
				print("Ти занадто далеко!")

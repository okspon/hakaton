
extends Label

@export var speed: float = 0.04

var is_typing: bool = false

func _ready() -> void:
	visible_characters = 0
	is_typing = true

	for i in range(get_total_character_count()):
		if not is_typing:
			break

		visible_characters += 1
		await get_tree().create_timer(speed).timeout

	visible_characters = -1
	is_typing = false


func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
			if is_typing:
				is_typing = false
				visible_characters = -1

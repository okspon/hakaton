extends Area2D

@export var pickup_distance = 250.0
@onready var label = $PickupLabel

func _ready():
	label.visible = false
	# Підключаємо сигнали наведення мишки програмно
	mouse_entered.connect(_on_mouse_entered)
	mouse_exited.connect(_on_mouse_exited)

func _on_mouse_entered():
	var player = get_tree().get_first_node_in_group("player")
	if player and player.global_position.distance_to(global_position) <= pickup_distance:
		label.visible = true

func _on_mouse_exited():
	label.visible = false

func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		var player = get_tree().get_first_node_in_group("player")
		if player and player.global_position.distance_to(global_position) <= pickup_distance:
			print("Предмет підібрано!")
			queue_free()

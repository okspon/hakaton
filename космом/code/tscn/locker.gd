extends Area2D

# Сюди в інспекторі перетягнеш файл item.tscn
@export var item_scene: PackedScene 

@onready var label = $InteractLabel
@onready var spawn_point = $SpawnPoint

var player_in_zone = false
var is_opened = false

func _ready():
	label.visible = false
	# Підключаємо сигнали входу/виходу гравця із зони шафи
	body_entered.connect(_on_body_entered)
	body_exited.connect(_on_body_exited)

func _on_body_entered(body):
	if body.is_in_group("player") and not is_opened:
		player_in_zone = true
		label.visible = true

func _on_body_exited(body):
	if body.is_in_group("player"):
		player_in_zone = false
		label.visible = false

func _process(delta):
	# Якщо гравець поруч, шафа ще не відкрита і натиснуто E
	if player_in_zone and not is_opened and Input.is_action_just_pressed("interact"):
		open_locker()

func open_locker():
	is_opened = true
	label.visible = false
	
	if item_scene:
		var item = item_scene.instantiate()
		# Додаємо предмет на головну сцену в координати SpawnPoint
		get_parent().add_child(item)
		item.global_position = spawn_point.global_position
		
		

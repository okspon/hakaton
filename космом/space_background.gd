extends Node2D

# Спрацьовує миттєво, як тільки ця сцена завантажилася
func _ready():
	$AnimationPlayer.play("fly")

# Спрацьовує автоматично, коли анімація дограє до кінця (5-та секунда)
func _on_animation_player_animation_finished(anim_name):
	# Перемикаємо гравця у сцену з кімнатою та шафками
	get_tree().change_scene_to_file("res://game_scene_1.tscn")

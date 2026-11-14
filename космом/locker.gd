extends TextureButton

@export var item_texture: Texture2D

@onready var item = get_parent().get_node("Item")

var opened = false

func _on_pressed():
	if opened:
		return

	opened = true
	item.texture = item_texture
	item.visible = true

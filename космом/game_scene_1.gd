extends Node

# Завантажуємо картинку відчиненої шафки (заміни назву файлу на свою з FileSystem)
var open_locker_texture = preload("res://ю.png")

# Список-інвентар, куди будуть складатися підібрані предмети
var inventory = []
var is_locker_open = false

# Спрацьовує, коли ти натискаєш на шафку
func _on_locker_button_pressed():
	if not is_locker_open:
		is_locker_open = true
		# Міняємо картинку шафки на відчинену
		$LockerButton.texture_normal = open_locker_texture
		# Робимо предмет всередині видимим
		$ItemButton.visible = true

# Спрацьовує, коли ти натискаєш на предмет, що з'явився
func _on_item_button_pressed():
	# Додаємо предмет в інвентар
	inventory.append("Ключ")
	print("Предмет підібрано! В інвентарі зараз: ", inventory)
	
	# Видаляємо предмет із шафки, бо ми його вже забрали
	$ItemButton.queue_free()

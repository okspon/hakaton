extends CharacterBody2D

@export var speed = 200

func _physics_process(delta):
	var direction = Input.get_axis("move_left", "move_right")

	velocity.x = direction * speed
	move_and_slide()

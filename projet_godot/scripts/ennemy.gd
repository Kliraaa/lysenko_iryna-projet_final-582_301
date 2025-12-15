extends Area2D
class_name Ennemy

@export var speed = 5

func _physics_process(delta: float) -> void:
	global_position.x += -speed * delta
	

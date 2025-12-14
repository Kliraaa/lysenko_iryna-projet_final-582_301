extends Area2D

func _ready() -> void:
	$message.hide()

func show_message(_body):
	if _body is Player:
		$Timer.start()
		$message.show()
		await $Timer.timeout
		$message.hide()

func hide_message(_body: Node2D) -> void:
	if _body is Player:
		$Timer.stop()
		$message.hide()

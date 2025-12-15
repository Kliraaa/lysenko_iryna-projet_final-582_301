extends Area2D

func _ready() -> void:
	$message.hide()

func show_message(_body):
	if _body is Hiori:
		print("message1")
		$Timer.start()
		$message.show()
		$"book-sfx".play()
		await $Timer.timeout
		$message.hide()
		

func hide_message(_body: Node2D) -> void:
	if _body is Hiori:
		$Timer.stop()
		$message.hide()

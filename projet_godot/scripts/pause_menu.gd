extends Control

func resume():
	get_tree().paused = false
	
func pause():
	get_tree().paused = true
	
func testEsc():
	if Input.is_action_just_pressed("menu") and get_tree().paused == false:
		pause()
	elif Input.is_action_just_pressed("menu") and get_tree().paused == true:
		resume()

func _on_resume_pressed() -> void:
	resume()



func _on_restart_pressed() -> void:
	resume()
	get_tree().reload_current_scene()


func _on_controls_pressed() -> void:
	pass # Replace with function body.

func _process(_delta: float) -> void:
	testEsc()

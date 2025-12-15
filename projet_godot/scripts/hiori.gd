extends CharacterBody2D
class_name Hiori

const SPEED = 450.0
const JUMP_VELOCITY = -550.0

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var run_sfx: AudioStreamPlayer2D = $AudioStreamPlayer2D
# @onready var death_sfx: AudioStreamPlayer = $death_sound


var taking_damage = false

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		run_sfx.stop()
		

	# Get the input direction
	var direction := Input.get_axis("move-left", "move-right")
	
	# flip sprite
	if direction > 0:
		animated_sprite.flip_h = false
	elif direction < 0:
		animated_sprite.flip_h = true
		
	# ANIMATIONS 
	if taking_damage: 
		animated_sprite.play("death")
		
		return
	if direction == 0:
		animated_sprite.play("idle")
		run_sfx.stop()
	else:
		animated_sprite.play("courir")
		if not run_sfx.playing:
				run_sfx.play()
		
	#apply movement
	if is_on_floor():
		if direction == 0:
			animated_sprite.play("idle")
		else:
			animated_sprite.play("courir")
	else: 
		run_sfx.stop()
		if velocity.y < 0:
			animated_sprite.play("saut_up")
		else:
			animated_sprite.play("tomber-saut_down")
		
	
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()


func take_damage():
	var hud = get_tree().current_scene.get_node("CanvasLayer")
	if hud.health > 0:
		hud.health -= 1
		hud.update_hearts(hud.health)
		
	taking_damage = true
	#death_sfx.play()

extends Area2D

@onready var pickup_sfx: AudioStreamPlayer2D = $PickupSound
@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _on_body_entered(_body: Node2D) -> void:
	print("Vous avez pris une lumiere")
	animation_player.play("pickup")
	pickup_sfx.play()

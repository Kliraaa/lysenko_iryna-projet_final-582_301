extends Area2D

@onready var audio_stream_player_2d: AudioStreamPlayer2D = $PickupSound
@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _on_body_entered(_body: Node2D) -> void:
	print("Vous avez pris un clef")
	animation_player.play("pickup")
	audio_stream_player_2d.play()

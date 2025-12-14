extends Area2D

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var audio_stream_player_2d: AudioStreamPlayer2D = $PickupSound

func _on_body_entered(_body: Node2D) -> void:
	print("Vous avez pris un epee")
	animation_player.play("pickup")
	audio_stream_player_2d.play()

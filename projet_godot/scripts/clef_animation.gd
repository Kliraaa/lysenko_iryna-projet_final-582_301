extends AnimatedSprite2D

func _ready() -> void:
	var tween = create_tween()
	tween.set_trans(Tween.TRANS_QUAD)
	tween.tween_property(self, "position:y", position.y-20, 1).from(position.y+20)
	tween.tween_property(self, "position:y", position.y+20, 1).from(position.y-20)
	tween.set_loops()

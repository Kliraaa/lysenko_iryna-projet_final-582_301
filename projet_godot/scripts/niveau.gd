extends Node2D

@onready var light_container = $"Light Container"
var hiori = null

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hiori = get_tree().get_first_node_in_group("hiori")
	assert(hiori!=null)
	hiori.light_shot.connect(_on_hiori_light_shot)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func _on_hiori_light_shot(attack_scene, location):
	var light = attack_scene.instantiate()
	light.global_position = location
	light_container.add_child(light)

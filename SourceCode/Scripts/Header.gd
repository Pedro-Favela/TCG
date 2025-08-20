extends PanelContainer

@onready var back: Button = $MarginContainer/HBoxContainer/Back
@export var scene_to_back: PackedScene
func _ready() -> void:
	back.connect("pressed",pressed)

func pressed():
	if scene_to_back == null:
		print("Botão não configurado")
		return
	var instance = scene_to_back.instantiate()
	Global.transition(instance)

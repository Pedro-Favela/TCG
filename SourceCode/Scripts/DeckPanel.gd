extends PanelContainer

@export var DeckName: String
var on_focus: bool = false

@onready var title: RichTextLabel = $MarginContainer/HBoxContainer/Title

func _ready() -> void:
	connect("mouse_entered", mouse_entered)
	connect("mouse_exited", mouse_exited)
	title.text = DeckName

func _input(event: InputEvent) -> void:
	if event is InputEventScreenTouch and event.is_pressed():
		print(event)
		if !on_focus:
			return
		#var path_to_deck:String = "res://Scenes/Pages/"+DeckName+".tscn"
		#if DeckName.dedent() == "":
			#print("DeckPanel sem destino")
			#return
		#if !FileAccess.file_exists(path_to_deck):
			#print(path_to_deck + " não é um path válido")
			#return
			
		var deck_scene = load("res://Scenes/Pages/Deck.tscn")
		var instance = deck_scene.instantiate()
		instance.Title = "[center]"+DeckName
		Global.transition(instance)

func mouse_entered():
	on_focus = true

func mouse_exited():
	on_focus = false

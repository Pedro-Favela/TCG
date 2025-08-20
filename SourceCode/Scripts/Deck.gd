extends Control

var Title: String = "PlaceHolder"

@onready var title_text: RichTextLabel = $VBoxContainer/Header/MarginContainer/HBoxContainer/Title/TitleText

func _ready() -> void:
	title_text.text = Title

extends Control

func _ready():
	$VBoxContainer/MainMenu.grab_focus()

# Switches to the Main Menu
func _on_MainMenu_pressed():
	get_tree().change_scene("res://MainMenu.tscn")

extends Control

func _ready():
	# Allows the keyboard to toggle the menu buttons with Start Button as
	# starting point
	$VBoxContainer/Start.grab_focus()

# Switches to the game scene when pressed
func _on_Start_pressed():
	get_tree().change_scene("res://Scenes/World.tscn")

# Closes the game when pressed
func _on_Quit_pressed():
	get_tree().quit()

# Switches to the Options Menu
func _on_Options_pressed():
	get_tree().change_scene("res://Scenes/OptionsMenu.tscn")

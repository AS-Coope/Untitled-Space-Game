extends Control

func _input(event):
	if event.is_action_pressed("pause"):
		# ensuring the game pauses upon request
		var pause_state = not get_tree().paused
		get_tree().paused = pause_state
		visible = pause_state

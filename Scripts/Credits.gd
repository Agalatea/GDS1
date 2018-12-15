extends MarginContainer

func _on_Return_mouse_entered():
	$MusicHighlight.play()
	$MarginContainer/CenterContainer/VBoxContainer/VBoxContainer/Return.set("custom_colors/font_color", Color(0,0,0))

func _on_Return_mouse_exited():
	$MarginContainer/CenterContainer/VBoxContainer/VBoxContainer/Return.set("custom_colors/font_color", Color(1,1,1))

func _on_Return_gui_input(ev):
	if ev is InputEventMouseButton and ev.button_index == BUTTON_LEFT and ev.pressed:
		$MusicInteraction.play()
		get_tree().current_scene.get_node("MainMenu").visible=true
		self.visible=false
		$MarginContainer/CenterContainer/VBoxContainer/VBoxContainer/Return.set("custom_colors/font_color", Color(1,1,1))

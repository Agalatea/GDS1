extends Node

func showPause():
	$MusicShow.play()

func _on_ReturnGame_gui_input(ev):
	if ev is InputEventMouseButton and ev.button_index == BUTTON_LEFT and ev.pressed:
		get_tree().paused=false
		self.hide()

func _on_ReturnGame_mouse_entered():
	$MusicHighlight.play()
	$MarginContainer/CenterContainer/VBoxContainer/VBoxContainer/ReturnGame.set("custom_colors/font_color", Color(1,0,0))


func _on_ReturnGame_mouse_exited():
	$MarginContainer/CenterContainer/VBoxContainer/VBoxContainer/ReturnGame.set("custom_colors/font_color", Color(0,0,0))


func _on_Retun_to_main_menu_gui_input(ev):
	if ev is InputEventMouseButton and ev.button_index == BUTTON_LEFT and ev.pressed:
		$MusicInteraction.play()
		get_tree().root.get_children()[0].queue_free()
		get_tree().change_scene("res://Scenes//MainMenu.tscn")


func _on_Retun_to_main_menu_mouse_entered():
	$MusicHighlight.play()
	$MarginContainer/CenterContainer/VBoxContainer/VBoxContainer/RetunToMain.set("custom_colors/font_color", Color(1,0,0))


func _on_Retun_to_main_menu_mouse_exited():
	$MarginContainer/CenterContainer/VBoxContainer/VBoxContainer/RetunToMain.set("custom_colors/font_color", Color(0,0,0))

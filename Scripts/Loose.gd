extends Node

func _on_Return_mouse_entered():
	$MarginContainer/CenterContainer/VBoxContainer/VBoxContainer/Return.set("custom_colors/font_color", Color(1,0,0))


func _on_Return_mouse_exited():
	$MarginContainer/CenterContainer/VBoxContainer/VBoxContainer/Return.set("custom_colors/font_color", Color(0,0,0))


func _on_Return_gui_input(ev):
	if ev is InputEventMouseButton and ev.button_index == BUTTON_LEFT and ev.pressed:
		get_tree().change_scene("res://Scenes//MainMenu.tscn")

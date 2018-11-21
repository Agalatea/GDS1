extends Node
var labelReturnGame
var labelReturnMenu

func _ready():
	labelReturnGame=get_tree().get_nodes_in_group("ReturnGame")
	labelReturnMenu=get_tree().get_nodes_in_group("ReturnMenu")


func _on_ReturnGame_gui_input(ev):
	if ev is InputEventMouseButton and ev.button_index == BUTTON_LEFT and ev.pressed:
		print("control mouse button pressed ReturnGame")


func _on_ReturnGame_mouse_entered():
	labelReturnGame[0].set("custom_colors/font_color", Color(0,0,0))


func _on_ReturnGame_mouse_exited():
	labelReturnGame[0].set("custom_colors/font_color", Color(1,1,1))


func _on_Retun_to_main_menu_gui_input(ev):
	if ev is InputEventMouseButton and ev.button_index == BUTTON_LEFT and ev.pressed:
		get_tree().change_scene("res://MainMenu.tscn")


func _on_Retun_to_main_menu_mouse_entered():
	labelReturnMenu[0].set("custom_colors/font_color", Color(0,0,0))


func _on_Retun_to_main_menu_mouse_exited():
	labelReturnMenu[0].set("custom_colors/font_color", Color(1,1,1))

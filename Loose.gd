extends Node

var labelReturn
func _ready():
	labelReturn=get_tree().get_nodes_in_group("Return")


func _on_Return_mouse_entered():
	labelReturn[0].set("custom_colors/font_color", Color(0,0,0))


func _on_Return_mouse_exited():
	labelReturn[0].set("custom_colors/font_color", Color(1,1,1))


func _on_Return_gui_input(ev):
	if ev is InputEventMouseButton and ev.button_index == BUTTON_LEFT and ev.pressed:
		get_tree().change_scene("res://MainMenu.tscn")

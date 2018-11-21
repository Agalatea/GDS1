extends Node

var labelNewGame
var labelCredits
var labelExit

func _ready():
	labelNewGame=get_tree().get_nodes_in_group("NewGame")
	labelCredits=get_tree().get_nodes_in_group("Credits")
	labelExit=get_tree().get_nodes_in_group("Exit")

func _on_NewGame_mouse_entered():
	labelNewGame[0].set("custom_colors/font_color", Color(0,0,0))

func _on_NewGame_mouse_exited():
	labelNewGame[0].set("custom_colors/font_color", Color(1,1,1))

func _on_NewGame_gui_input(ev):
	if ev is InputEventMouseButton and ev.button_index == BUTTON_LEFT and ev.pressed:
		get_tree().change_scene("res://Main.tscn")

func _on_Credits_mouse_entered():
	labelCredits[0].set("custom_colors/font_color", Color(0,0,0))


func _on_Credits_mouse_exited():
	labelCredits[0].set("custom_colors/font_color", Color(1,1,1))


func _on_Credits_gui_input(ev):
	if ev is InputEventMouseButton and ev.button_index == BUTTON_LEFT and ev.pressed:
		get_tree().change_scene("res://Credits.tscn")


func _on_Exit_mouse_entered():
	labelExit[0].set("custom_colors/font_color", Color(0,0,0))


func _on_Exit_mouse_exited():
	labelExit[0].set("custom_colors/font_color", Color(1,1,1))


func _on_Exit_gui_input(ev):
	if ev is InputEventMouseButton and ev.button_index == BUTTON_LEFT and ev.pressed:
		get_tree().quit()

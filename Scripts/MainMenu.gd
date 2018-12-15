extends Node

func _ready():
	$Creadits.visible=false
	$Music.play()

func _on_NewGame_mouse_entered():
	$MusicHighlight.play()
	$MainMenu/CenterContainer/VBoxContainer/VBoxContainer/NewGame.set("custom_colors/font_color", Color(0,0,0))

func _on_NewGame_mouse_exited():
	$MainMenu/CenterContainer/VBoxContainer/VBoxContainer/NewGame.set("custom_colors/font_color", Color(1,1,1))

func _on_NewGame_gui_input(ev):
	if ev is InputEventMouseButton and ev.button_index == BUTTON_LEFT and ev.pressed:
		$MusicInteract.play()
		get_tree().change_scene("res://Scenes//Level1.tscn")

func _on_Credits_mouse_entered():
	$MusicHighlight.play()
	$MainMenu/CenterContainer/VBoxContainer/VBoxContainer/Credits.set("custom_colors/font_color", Color(0,0,0))


func _on_Credits_mouse_exited():
	$MainMenu/CenterContainer/VBoxContainer/VBoxContainer/Credits.set("custom_colors/font_color", Color(1,1,1))


func _on_Credits_gui_input(ev):
	if ev is InputEventMouseButton and ev.button_index == BUTTON_LEFT and ev.pressed:
		$MusicInteract.play()
		$MainMenu/CenterContainer/VBoxContainer/VBoxContainer/Credits.set("custom_colors/font_color", Color(1,1,1))
		$Creadits.visible=true
		$MainMenu.visible=false


func _on_Exit_mouse_entered():
	$MusicHighlight.play()
	$MainMenu/CenterContainer/VBoxContainer/VBoxContainer/Exit.set("custom_colors/font_color", Color(0,0,0))


func _on_Exit_mouse_exited():
	$MainMenu/CenterContainer/VBoxContainer/VBoxContainer/Exit.set("custom_colors/font_color", Color(1,1,1))


func _on_Exit_gui_input(ev):
	if ev is InputEventMouseButton and ev.button_index == BUTTON_LEFT and ev.pressed:
		$MusicInteract.play()
		get_tree().quit()

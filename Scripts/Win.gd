extends Node
var NextLevel=""
var SoccerPoint=0
var LifePoint=0
var Seconds=0
var Minute=0

func _on_Return_mouse_entered():
	$MarginContainer/CenterContainer/Rows/ExitRow/Return.set("custom_colors/font_color", Color(1,0,0))

func _on_Return_mouse_exited():
	$MarginContainer/CenterContainer/Rows/ExitRow/Return.set("custom_colors/font_color", Color(0,0,0))

func _on_Return_gui_input(ev):
	if ev is InputEventMouseButton and ev.button_index == BUTTON_LEFT and ev.pressed:
		get_tree().root.get_children()[0].queue_free()
		get_tree().change_scene("res://Scenes//MainMenu.tscn")

func _on_NextLevel_mouse_entered():
	$MarginContainer/CenterContainer/Rows/ExitRow/NextLevel.set("custom_colors/font_color", Color(1,0,0))

func _on_NextLevel_mouse_exited():
	$MarginContainer/CenterContainer/Rows/ExitRow/NextLevel.set("custom_colors/font_color", Color(0,0,0))

func _on_NextLevel_gui_input(ev):
	if ev is InputEventMouseButton and ev.button_index == BUTTON_LEFT and ev.pressed and NextLevel!="":
		var next_level_resource =load("res://Scenes//"+NextLevel+".tscn")
		var next=next_level_resource.instance()
		next.emit_signal("setScorePoints",SoccerPoint)
		next.emit_signal("setLifePoints",LifePoint)
		next.emit_signal("setTime",Minute,Seconds)
		get_tree().root.add_child(next)
		
		# Remove the current level
		var level = get_tree().root.get_children()[0]
		level.queue_free()
		

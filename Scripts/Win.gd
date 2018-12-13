extends Node
export  var NextLevel=""
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
	if ev is InputEventMouseButton and ev.button_index == BUTTON_LEFT and ev.pressed:
		var next_level_resource =load("res://Scenes//"+NextLevel+".tscn")
		var next=next_level_resource.instance()
		next.emit_signal("setScorePoints",SoccerPoint)
		next.emit_signal("setLifePoints",LifePoint)
		next.emit_signal("setTime",Minute,Seconds)
		#get_tree().change_scene("res://Scenes//"+NextLevel+".tscn")
		get_tree().root.add_child(next)
		#get_tree().change_scene_to(next.get_tree())
		#get_tree().current_scene.get_tree().get_nodes_in_group("Level")[0].emit_signal("setScorePoints",SoccerPoint)
		#get_tree().current_scene.get_tree().get_nodes_in_group("Level")[0].emit_signal("setLifePoints",LifePoint)
		#get_tree().current_scene.get_tree().get_nodes_in_group("Level")[0].emit_signal("setTime",Minute,Seconds)

		# Add the next level
		#var text ="res://Scenes//"+NextLevel+".tscn"
		#var next_level_resource = load(text)
		#var next_level = next_level_resource.instance()
		#get_tree().root.add_child(next_level)
		
		# Remove the current level
		var level = get_tree().root.get_children()[0]
		level.queue_free()
		

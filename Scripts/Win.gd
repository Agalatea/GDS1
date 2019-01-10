extends Node
var NextLevel=""
var LifePoint=0
var Buttons
var focusIndex=0
func getButtons():
	focusIndex=0
	Buttons=self.get_tree().get_nodes_in_group("ButtonWin")
	focusButton(Buttons[focusIndex])

func focusButton(button):
	button.texture_normal =button.texture_hover

func exitfocusButton(button):
	button.texture_normal =button.texture_pressed

func _input(event):
	if !self.visible:
		return

	if event.is_action("ui_up") and event.is_pressed():
		exitfocusButton(Buttons[focusIndex])
		var focus=0
		if focusIndex==0:
			focus=Buttons.size()-1
		else:
			focus=focusIndex-1
		if focusIndex!=focus:
			focusIndex=focus
			$MusicHighlight.play()
		focusButton(Buttons[focusIndex])
	elif event.is_action("ui_down") and event.is_pressed():
		exitfocusButton(Buttons[focusIndex])
		var focus=0
		if focusIndex==Buttons.size()-1:
			focus=0
		else:
			focus=focusIndex+1
		if focusIndex!=focus:
			focusIndex=focus
			$MusicHighlight.play()
		focusButton(Buttons[focusIndex])
	elif event.is_action("ui_accept") and event.is_pressed():
		enterButton(Buttons[focusIndex])
	event=null

func enterButton(button):
	if !self.visible:
		return

	$MusicInteract.play()
	if button.is_in_group("Next"):
		# Remove the current level
		var level = get_tree().root.get_children()[0]
		level.queue_free()
		#Add level to scen
		var next_level_resource =load("res://Scenes/"+NextLevel+".tscn")
		var next=next_level_resource.instance()
		next.emit_signal("setLifePoints",LifePoint)
		get_tree().root.add_child(next)
	elif button.is_in_group("Return"):
		get_tree().root.get_children()[0].queue_free()
		get_tree().change_scene("res://Scenes/Main.tscn")

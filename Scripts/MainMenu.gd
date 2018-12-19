extends Node
var Buttons
var focusIndex=0
var actionInput=true
func _ready():
	Input.set_mouse_mode( Input.MOUSE_MODE_HIDDEN)
	get_tree().paused=true
	Buttons=self.get_tree().get_nodes_in_group("Button")
	focusButton(Buttons[focusIndex])
	$Music.play()

func focusButton(button):
	button.set("custom_colors/font_color", Color(0,0,0))
	
func exitfocusButton(button):
	button.set("custom_colors/font_color", Color(1,1,1))

func _process(delta):
	actionInput=true

func _input(event):
	if !actionInput:
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
	if button.is_in_group("NewGame"):
		get_tree().change_scene("res://Scenes//Level1.tscn")
	elif button.is_in_group("Credits"):
		self.visible=false
		get_tree().current_scene.get_node("Credits").pause_mode=PAUSE_MODE_PROCESS
		get_tree().current_scene.get_node("Credits").visible=true
		self.pause_mode=PAUSE_MODE_STOP
	elif button.is_in_group("Exit"):
		get_tree().quit()
	actionInput=false

extends Control
var Buttons
var focusIndex=0
var actionInput=true
func _ready():
	Buttons=self.get_tree().get_nodes_in_group("ButtonCredits")
	focusButton(Buttons[focusIndex])

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
	elif event.is_action("ui_accept") and event.is_pressed() and !event.is_echo():
		enterButton(Buttons[focusIndex])

func enterButton(button):
	if !self.visible:
		return

	if button.is_in_group("Return"):
		$MusicInteraction.play()
		self.visible=false
		self.pause_mode=PAUSE_MODE_STOP
		get_tree().current_scene.get_node("MainMenu").pause_mode=PAUSE_MODE_PROCESS
		get_tree().current_scene.get_node("MainMenu").visible=true
	actionInput=false

func focusButton(button):
	button.set("custom_colors/font_color", Color(0,0,0))
	
func exitfocusButton(button):
	button.set("custom_colors/font_color", Color(1,1,1))
extends Control
signal addLifePoints(lifePoints)
signal addLifePointsBoss(lifePoints)
signal losseLifePointBoss
signal hitBossFirst
signal hitBossSecond
signal deadBossFirst
signal deadBossSecond
signal setNextLevel(text)
signal visibleNextLexel(value)
signal visibleReturnMain(value)
signal hideElement
signal showElement
export var NameBossFirst=""
export var NameBossSecond=""
export var TextStage=""
export var NameLevel=""
func _ready():
	$HBoxContainer/Right/LeftTop2/RightPanel/NameBossFirst/NameBossFirst.text=NameBossFirst
	$HBoxContainer/Right/LeftTop2/RightPanel/NameBossSecond/NameBossSecond.text=NameBossSecond
	$HBoxContainer/Left/LeftBottom/Rows/MarginContainer/NameStage.text=TextStage
	$HBoxContainer/Left/LeftBottom/Rows/MarginContainer2/NameLevel.text=NameLevel

func _on_GUI_addLifePoints(lifePoints):
	var life_resource = preload("res://Scenes/LifePoint.tscn")
	for i in range(0, lifePoints):
		var life = life_resource.instance()
		$HBoxContainer/Right/LeftTop2/RightPanel/Life/VBoxContainer/LifePoints.add_child(life)

func losse_LifePoint():
	$MusicLostLifePoint.play()
	$HBoxContainer/Right/LeftTop2/RightPanel/Life/VBoxContainer/LifePoints.get_child(0).queue_free()


func _on_GUI_visibleNextLexel(value):
	$Win/MarginContainer/CenterContainer/Rows/ExitRow/NextLevel.visible=value
	if(!value):
		$Win.Buttons.erase($Win/MarginContainer/CenterContainer/Rows/ExitRow/NextLevel)
		$Win.focusButton($Win.Buttons[0])

func _on_GUI_visibleReturnMain(value):
	$Win/MarginContainer/CenterContainer/Rows/ExitRow/Return.visible=value
	if(!value):
		$Win.Buttons.erase($Win/MarginContainer/CenterContainer/Rows/ExitRow/Return)
		$Win.focusButton($Win.Buttons[0])

func _on_GUI_setNextLevel(text):
	$Win.NextLevel=text

func _on_GUI_deadBossFirst():
	$HBoxContainer/Right/LeftTop2/RightPanel/AnimationBossFirst.play("deadBossFirst")

func _on_GUI_deadBossSecond():
	$HBoxContainer/Right/LeftTop2/RightPanel/AnimationBossSecond.play("deadBossSecond")


func _on_GUI_addLifePointsBoss(lifePoints):
	var life_resource = preload("res://Scenes/LifePoint.tscn")
	for i in range(0, lifePoints):
		var life = life_resource.instance()
		$HBoxContainer/Left/LeftBottom/Rows/LifeBoss/VBoxContainer/LifePoints.add_child(life)

func _on_GUI_losseLifePointBoss():
	$HBoxContainer/Left/LeftBottom/Rows/LifeBoss/VBoxContainer/LifePoints.get_child(0).queue_free()
	var emptyLifePoint_resource = preload("res://Scenes/EmptyLifePoint.tscn")
	var emptyLifePoint = emptyLifePoint_resource.instance()
	$HBoxContainer/Left/LeftBottom/Rows/LifeBoss/VBoxContainer/LifePoints.add_child(emptyLifePoint)

func _on_GUI_hideElement():
	$HBoxContainer/Left/BossFirst.visible=false
	$HBoxContainer/Left/BossSecond.visible=false
	$HBoxContainer/Left/LeftBottom/Rows.visible=false
	$HBoxContainer/Right/LeftTop2/RightPanel.visible=false

func _on_GUI_showElement():
	$HBoxContainer/Left/BossFirst.visible=true
	$HBoxContainer/Left/BossSecond.visible=true
	$HBoxContainer/Left/LeftBottom/Rows.visible=true
	$HBoxContainer/Right/LeftTop2/RightPanel.visible=true

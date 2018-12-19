extends Control
signal addLifePoints(lifePoints)
signal addScorePoints(scorePoints)
signal hitBossFirst
signal hitBossSecond
signal deadBossFirst
signal deadBossSecond
signal setNextLevel(text)
signal setTime(minute,second)
signal visibleNextLexel(value)
signal visibleReturnMain(value)
var second=0
var minute=0
export var NameBossFirst=""
export var NameBossSecond=""
export var TextStage=""
export var NameLevel=""
func _ready():
	_on_Timer_timeout()
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


func _on_Timer_timeout():
	second=second+1
	if(second==60):
		minute=minute+1
		second=0
	var separator=":"
	if(second<10):
		separator=":0"
	var time=str(minute)+separator+str(second)
	$HBoxContainer/Right/LeftTop2/RightPanel/Time/VBoxContainer/Time.set_text(time)


func _on_GUI_addScorePoints(scorePoints):
	$Win.SoccerPoint=scorePoints
	var score=str(scorePoints)
	var textSocer=score
	for i in range(0,9-score.length()):
		textSocer="0"+textSocer
	$HBoxContainer/Right/LeftTop2/RightPanel/ScorePoint/VBoxContainer/Score.set_text(textSocer)

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

func _on_GUI_setTime(minute, second):
	self.second=second
	self.minute=minute

func _on_GUI_setNextLevel(text):
	$Win.NextLevel=text

func _on_GUI_deadBossFirst():
	$HBoxContainer/Right/LeftTop2/RightPanel/AnimationBossFirst.play("deadBossFirst")

func _on_GUI_deadBossSecond():
	$HBoxContainer/Right/LeftTop2/RightPanel/AnimationBossSecond.play("deadBossSecond")

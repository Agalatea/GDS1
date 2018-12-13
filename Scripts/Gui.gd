extends Control
signal addLifePoints(lifePoints)
signal addScorePoints(scorePoints)
signal hitBossFirst
signal hitBossSecond
signal deadBossFirst
signal deadBossSecond
signal setTime(minute,second)
signal visibleNextLexel(value)
signal visibleReturnMain(value)
var second=0
var minute=0

func _ready():
	_on_Timer_timeout()

func _on_GUI_addLifePoints(lifePoints):
	var life_resource = preload("res://Scenes/LifePoint.tscn")
	for i in range(0, lifePoints):
		var life = life_resource.instance()
		$HBoxContainer/Right/LeftTop2/RightPanel/Life/VBoxContainer/LifePoints.add_child(life)

func losse_LifePoint():
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

func _on_GUI_visibleReturnMain(value):
	$Win/MarginContainer/CenterContainer/Rows/ExitRow/Return.visible=value

func _on_GUI_setTime(minute, second):
	self.second=second
	self.minute=minute

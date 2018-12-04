extends Control
signal addLifePoints(lifePoints)
signal addScorePoints(scorePoints)
var second=0
var minute=0
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
	var score=str(scorePoints)
	var textSocer=score
	for i in range(0,9-score.length()):
		textSocer="0"+textSocer
	$HBoxContainer/Right/LeftTop2/RightPanel/ScorePoint/VBoxContainer/Score.set_text(textSocer)

extends MarginContainer
signal losseLifePoint
signal gameOver
func _on_Player_losseLifePoint():
	$AnimationPlayer.play("LosseLifePoint")


func _on_Player_gameOver():
	$AnimationPlayer.play("gameOver")

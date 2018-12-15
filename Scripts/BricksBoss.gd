extends Node2D
signal dead
signal hitBoss
var isDead=false
func _isDead():
	return isDead

func _on_BricksBoss_dead():
	$MusicDeadBoss.play()
	isDead=true


func _on_BricksBoss_hitBoss():
	$MusicHitBoss.play()

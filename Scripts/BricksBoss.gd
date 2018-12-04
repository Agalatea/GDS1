extends Node2D
signal dead
signal hitBoss
var isDead=false
func _isDead():
	return isDead

func _on_BricksBoss_dead():
	isDead=true

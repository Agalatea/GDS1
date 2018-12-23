extends Node2D
signal dead
signal hitBoss
var isDead=false
var countBricks
var rangeHit=2
func _ready():
	countBricks=float(self.get_child_count()-2)

func _isDead():
	return isDead

func _on_BricksBoss_dead():
	$MusicDeadBoss.play()
	isDead=true


func _on_BricksBoss_hitBoss():
	rangeHit=rangeHit-1
	$MusicHitBoss.play()

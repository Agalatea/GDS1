extends Node2D
signal dead
func _on_Boss2_dead():
	$AnimationPlayer.play("Dead")

func _on_BricksSecondBoss_dead():
	_on_Boss2_dead()


func _on_BricksSecondBoss_hitBoss():
	$AnimationPlayer.play("Hit")

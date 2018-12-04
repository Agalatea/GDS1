extends Node2D
signal dead
func _on_Boss1_dead():
	$AnimationPlayer.play("Dead")

func _on_BricksFirstBoss_dead():
	_on_Boss1_dead()


func _on_BricksFirstBoss_hitBoss():
	$AnimationPlayer.play("Hit")

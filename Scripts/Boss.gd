extends Node2D
signal dead
func _on_Boss_dead():
	$AnimationPlayer.play("Dead")

func _hitBoss():
	$AnimationPlayer.play("Hit")

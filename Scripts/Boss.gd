extends Node2D
signal dead
var hit=false
var colorG
var colorB
func _physics_process(delta):
	if(hit):
		$TextureRect.modulate.g8=colorG/2
		$TextureRect.modulate.b8=colorB/2
		hit=false

func _on_Boss_dead():
	$AnimationPlayer.play("Dead")

func _hitBoss():
	colorG=$TextureRect.modulate.g8
	colorB=$TextureRect.modulate.b8
	$AnimationPlayer.play("Hit")

func _on_AnimationPlayer_animation_finished(anim_name):
	if(anim_name=="Hit"):
		hit=true

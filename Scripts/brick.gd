extends Area2D
export (int) var HP=1
var maxHP
var beFree = false
signal dead
var hit=false
var colorG
var colorB
var colorA
signal changeColor(index)
func _ready():
	maxHP=HP

func _process(delta):
	if(beFree):
		free()

func _physics_process(delta):
	if(hit):
		$AnimatedSprite.modulate.g8=colorG/2
		$AnimatedSprite.modulate.b8=colorB/2
		$AnimatedSprite.modulate.a8=colorA/1.1
		hit=false

func _on_brick_body_entered(body):
	var position = body.position #or body.get_pos()
	print("_on_brick_body_entered collision position: ", str(position))
	if (body.get_name() == "Ball"):
		HP=HP-1
		body.emit_signal("brickHit", self )
		if(HP<=0):
			beFree = true

func _on_brick_changeColor(index):
	if(index+1<=1):
		$AnimatedSprite.play("red")
	elif(index+1<=2):
		$AnimatedSprite.play("light_orange")

func _on_Boss_dead():
	$AnimationPlayer.play("Dead")

func _hitBoss():
	colorG=$AnimatedSprite.modulate.g8
	colorB=$AnimatedSprite.modulate.b8
	colorA=$AnimatedSprite.modulate.a8
	$AnimationPlayer.play("Hit")

func _on_AnimationPlayer_animation_finished(anim_name):
	if(anim_name=="Hit"):
		hit=true
	if(anim_name=="Dead"):
		beFree=true
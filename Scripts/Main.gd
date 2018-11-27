extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var winer=false
var loose=false
signal showWin
func _ready():
	winer=false
	loose=false
	$Paddle.start($PaddleStartPosition.position, $LeftBound.position.x+15, $RightBound.position.x-15  )  #to be moved to start game function
	get_tree().paused=false
	$Ball.start($BallStartPosition.position)
	
	

func _process(delta):
	if Input.is_action_pressed("ui_cancel") && !winer && !loose:
		get_tree().paused=true
		$GUI/Pause.show()


func _on_Paddle_body_entered(body):
	print ("Paddle collision with " + body.get_name())
	if (body.get_name() == "Ball"):
		var paddlePosition = $Paddle.position
		var localVelocity = $Ball.applied_force;  
		print ("localVelocity " + str(localVelocity))
		$Ball.emit_signal("paddleHit", paddlePosition)
#		var col = $Paddle.$CollisionShape2D.collide_and_get_contacts()


func _on_RightBound_body_entered(body):
	print ("RightBound collision with " + body.get_name())
	if (body.get_name() == "Ball"):
		$Ball.emit_signal("rightBoundHit")


func _on_LeftBound_body_entered(body):
	print ("LeftBound collision with " + body.get_name())
	if (body.get_name() == "Ball"):
		$Ball.emit_signal("leftBoundHit")


func _on_BottomBound_body_entered(body):
	print ("BottomBound collision with " + body.get_name())
	if (body.get_name() == "Ball"):
		get_tree().paused=true
		loose=true
		$GUI/AnimationPlayer.play("Loose")

func _on_Main_showWin():
	get_tree().paused=true
	winer=true
	$GUI/AnimationPlayer.play("Win")

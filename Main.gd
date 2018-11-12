extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():

	$Paddle.start($PaddleStartPosition.position, $LeftBound.position.x, $RightBound.position.x  )  #to be moved to start game function
	$Ball.start($BallStartPosition.position)
	
	

func _process(delta):
	
    pass


func _on_Paddle_body_entered(body):
	print ("Paddle collision with " + body.get_name())
	if (body.get_name() == "Ball"):
		$Ball.emit_signal("paddleHit")

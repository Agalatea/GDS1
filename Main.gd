extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	$Paddle.start($PaddleStartPosition.position)  #to be moved to start game function
	$Ball.start($BallStartPosition.position)

func _process(delta):
     pass

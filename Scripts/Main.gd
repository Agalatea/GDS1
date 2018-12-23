extends Control

func _ready():
	Input.set_mouse_mode( Input.MOUSE_MODE_HIDDEN)
	self.get_tree().paused=true
	$Paddle.start($Paddle.position, $LeftBound.position.x+15, $RightBound.position.x-15 )
	$Music.play()
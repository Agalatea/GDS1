extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var winer=false
var loose=false
var pauseMusic
export (int) var LifeCount
export var NextLevel=""
var scorePoints=0
signal showWin
signal addScorePoints
signal setScorePoints(points)
signal setLifePoints(points)
signal setTime(minute, secondd)
signal closePause
func _ready():
	start()
	$GUI.emit_signal("addLifePoints",LifeCount)
	$GUI.emit_signal("setNextLevel",NextLevel)
	winer=false
	loose=false
	$MusicBackground.play()
	get_tree().paused=false
	


func _process(delta):
	if Input.is_action_pressed("ui_left")  ||  Input.is_action_pressed("ui_right"): 
		$Ball.emit_signal("paddleMove", $Paddle.position) 

func _input(event):
	if event.is_action("ui_cancel") and event.is_pressed() && !winer && !loose:
		get_tree().paused=true
		$GUI/Pause.show()
		$GUI/Pause.showPause()
		pauseMusic = $MusicBackground.get_playback_position( )
		$MusicBackground.stop()
	

func _on_Paddle_body_entered(body):
	print ("Paddle collision with " + body.get_name())
	if (body.get_name() == "Ball"):
		var paddlePosition = $Paddle.position
		var localVelocity = body.applied_force;  
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
		if (LifeCount == 0):
			get_tree().paused=true
			loose=true
			$MusicBackground.stop()
			$GUI/Loose.getButtons()
			$GUI/Loose.show()
			$GUI/AnimationPlayer.play("Loose")
			$GUI/Loose/Music.play()
		else:
			LifeCount=LifeCount-1
			$GUI.losse_LifePoint()
			start() # restart

func _on_Main_showWin():
	get_tree().paused=true
	winer=true
	$MusicBackground.stop()
	$GUI/Win.getButtons()
	if NextLevel!="":
		$GUI.emit_signal("visibleNextLexel",true)
		$GUI.emit_signal("visibleReturnMain",false)
		$GUI/Win/Music.play()
	else:
		$GUI.emit_signal("visibleNextLexel",false)
		$GUI.emit_signal("visibleReturnMain",true)
		$GUI/Win/Victory.play()
	$GUI/Win.show()
	$GUI/AnimationPlayer.play("Win")
	$GUI/Win.Seconds=$GUI.second
	$GUI/Win.Minute=$GUI.minute
	$GUI/Win.LifePoint=self.LifeCount


func _on_TopBound_body_entered(body):
	print ("TopBound collision with " + body.get_name())
	if (body.get_name() == "Ball"):
		$Ball.emit_signal("topBoundHit")

func start():
	$Paddle.start($PaddleStartPosition.position, $LeftBound.position.x+15, $RightBound.position.x-15  )  #to be moved to start game function
	$Ball._reset()
	$Ball.start($PaddleStartPosition.position)

func _on_Main_addScorePoints():
	scorePoints=scorePoints+1
	$GUI.emit_signal("addScorePoints",scorePoints)


func _on_BricksSecondBoss_dead():
	$GUI.emit_signal("deadBossSecond")


func _on_BricksFirstBoss_dead():
	$GUI.emit_signal("deadBossFirst")


func _on_BricksSecondBoss_hitBoss():
	$GUI.emit_signal("hitBossSecond")


func _on_BricksFirstBoss_hitBoss():
	$GUI.emit_signal("hitBossFirst")

func _on_Level_setScorePoints(points):
	scorePoints=points
	$GUI.emit_signal("addScorePoints",scorePoints)


func _on_Level_setLifePoints(points):
	LifeCount=points


func _on_Level_setTime(minute, secondd):
	$GUI.minute=minute
	$GUI.second=secondd

func _on_Level_closePause():
	$MusicBackground.play()
	$MusicBackground.seek(pauseMusic)

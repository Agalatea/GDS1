extends RigidBody2D

var paddleSpeedFactor  
var hitTimes  #how many times ball hit brick
var paddlePosition
var starting
export (int) var maxBallXSpeed
export (int) var maxBallYSpeed
export (float) var ballSpeefFactor
export (int) var hitAngle
export (int) var initialBallXSpeed
export (int) var initialBallYSpeed
export (int) var ballSpeedIncreaseX
export (int) var ballSpeedIncreaseY
signal paddleHit(paddlePosition)
signal rightBoundHit
signal leftBoundHit
signal topBoundHit
signal brickHit(brickBody)
signal paddleMove(pos)

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var _initial_state
var _initial_position

func _ready():
    starting =true
    _initial_position = get_global_transform().origin
    self.set_physics_process(true)
    paddleSpeedFactor = 1.3
    hitTimes=0
    hide()

func _process(delta):
	if starting && (Input.is_action_pressed("ui_up") ||  Input.is_key_pressed(KEY_SPACE)  ):
		set_linear_velocity(Vector2(rand_range(-200,200),-200).normalized()*300)
		starting = false
	if (starting) :
		if(_initial_state!=null):
			self._initial_state.transform.origin = paddlePosition
		self.transform.origin = paddlePosition
	else:
		var maxX = 0
		var maxY = 0
		if (initialBallXSpeed + hitTimes * ballSpeedIncreaseX < maxBallXSpeed ):
			maxX = initialBallXSpeed + hitTimes * ballSpeedIncreaseX 
		else:
			maxX = maxBallXSpeed
		if (initialBallYSpeed + hitTimes * ballSpeedIncreaseY < maxBallYSpeed ):
			maxY = initialBallYSpeed + hitTimes * ballSpeedIncreaseY 
		else:
			maxY = maxBallYSpeed
		if linear_velocity.y > maxY:
			linear_velocity.y=maxY
		elif linear_velocity.y < -1 * maxY:
			linear_velocity.y=-1 * maxY
		if linear_velocity.x > maxX:
			linear_velocity.x = maxX
		elif linear_velocity.x < -1 * maxX:
			linear_velocity.x = -1 * maxX
#	elif linear_velocity.x >0 and linear_velocity.x < 30:
#		linear_velocity.x = 30
#	elif linear_velocity.x <0 and linear_velocity.x > -30:
#		linear_velocity.x = -30 
#	print ("LI  "+ str(linear_velocity))

func _integrate_forces(state):
	_initial_state=state
	if (starting) :
		state.transform.origin = paddlePosition
	else:
		var maxX = 0
		var maxY = 0
		if (initialBallXSpeed + hitTimes * ballSpeedIncreaseX < maxBallXSpeed ):
			maxX = initialBallXSpeed + hitTimes * ballSpeedIncreaseX 
		else:
			maxX = maxBallXSpeed
		if (initialBallYSpeed + hitTimes * ballSpeedIncreaseY < maxBallYSpeed ):
			maxY = initialBallYSpeed + hitTimes * ballSpeedIncreaseY 
		else:
			maxY = maxBallYSpeed
		if linear_velocity.y > maxY:
			linear_velocity.y=maxY
		elif linear_velocity.y < -1 * maxY:
			linear_velocity.y=-1 * maxY
		if linear_velocity.x > maxX:
			linear_velocity.x = maxX
		elif linear_velocity.x < -1 * maxX:
			linear_velocity.x = -1 * maxX
#	elif linear_velocity.x >0 and linear_velocity.x < 30:
#		linear_velocity.x = 30
#	elif linear_velocity.x <0 and linear_velocity.x > -30:
#		linear_velocity.x = -30 
#	print ("LI  "+ str(linear_velocity))

func start(pos):
    position=pos
    starting =true
    paddlePosition=pos
    show()
    $CollisionShape2D.disabled = false



func _on_Ball_paddleHit(paddlePosition):
	$MusicBoundPallet.play()
	print ("BALL HIT with paddle "  )
	print ("Mid of Paddle position" + str(paddlePosition) )
	print ("_on_Ball_paddleHit linear_velocity " + str(linear_velocity))
	var modY = linear_velocity.y * ballSpeefFactor;
	var ImpulsePoint = Vector2 (0, $CollisionShape2D.shape.radius/2)
	var positionDiffrence = position.x - paddlePosition.x 
	var factor = hitAngle
	print ("positionDiffrence " + str(positionDiffrence))
	if (position.x - paddlePosition.x < -25 ): #left side
		apply_impulse(ImpulsePoint, Vector2(-1 * factor ,-0.5 * paddleSpeedFactor -modY))
	elif (position.x - paddlePosition.x < -20 ): #left side
		apply_impulse(ImpulsePoint, Vector2(-1* factor,-1 * paddleSpeedFactor -modY))
	elif (position.x - paddlePosition.x < -15 ): #left side
		apply_impulse(ImpulsePoint, Vector2(-1* factor,-1.5 * paddleSpeedFactor -modY))
	elif (position.x - paddlePosition.x < -10 ): #left side
		apply_impulse(ImpulsePoint, Vector2(-1* factor,-2 * paddleSpeedFactor -modY))
	elif (position.x - paddlePosition.x < 0 ): #left side
		apply_impulse(ImpulsePoint, Vector2(-1* factor,-2.5 * paddleSpeedFactor -modY))
	elif (position.x - paddlePosition.x > 25 ): #right side
		apply_impulse(ImpulsePoint, Vector2(1* factor,-0.5 * paddleSpeedFactor -modY))
	elif (position.x - paddlePosition.x > 20 ): #right side
		apply_impulse(ImpulsePoint, Vector2(1* factor,-1 * paddleSpeedFactor -modY))
	elif (position.x - paddlePosition.x > 15 ): #right side
		apply_impulse(ImpulsePoint, Vector2(1* factor,-1.5 * paddleSpeedFactor -modY))
	elif (position.x - paddlePosition.x > 10 ): #right side
		apply_impulse(ImpulsePoint, Vector2(1* factor,-2 * paddleSpeedFactor-modY))
	elif (position.x - paddlePosition. x >= 0 ): #right side
		apply_impulse(ImpulsePoint, Vector2(1* factor, -2.5 * paddleSpeedFactor-modY))

func _on_Ball_rightBoundHit():
	$MusicBoundSide.play()
	print (" _on_Ball_rightBoundHit linear_velocity " + str(linear_velocity))
	var ImpulsePoint = Vector2 (0, $CollisionShape2D.shape.radius/2)
	if (linear_velocity.y >= 0):  #going down
		apply_impulse(ImpulsePoint, Vector2(-5, 2.5 * paddleSpeedFactor))
	else: #going up
		apply_impulse(ImpulsePoint, Vector2(-5, -2.5 * paddleSpeedFactor))


func _on_Ball_leftBoundHit():
	$MusicBoundSide.play()
	print ("_on_Ball_leftBoundHit linear_velocity " + str(linear_velocity))
	var ImpulsePoint = Vector2 (0, $CollisionShape2D.shape.radius/2)
	if (linear_velocity.y >= 0):  #going down
		apply_impulse(ImpulsePoint, Vector2(5, 2.5 * paddleSpeedFactor))
	else: #going up
		apply_impulse(ImpulsePoint, Vector2(5, -2.5 *paddleSpeedFactor ))
		
func _on_Ball_topBoundHit():
	$MusicBoundSide.play()
	print ("_on_Ball_topBoundHit linear_velocity " + str(linear_velocity))
	var ImpulsePoint = Vector2 (0, $CollisionShape2D.shape.radius/2)
	apply_impulse(ImpulsePoint, Vector2(linear_velocity.x * ballSpeefFactor, linear_velocity.y * -1 * ballSpeefFactor))


func _on_Ball_brickHit(brickBody):
	print ("_on_Ball_brickHit linear_velocity " + str(linear_velocity))
	var ImpulsePoint = Vector2 (0, $CollisionShape2D.shape.radius/2)
	apply_impulse(ImpulsePoint, Vector2(linear_velocity.x * ballSpeefFactor, linear_velocity.y * -1 * ballSpeefFactor))
	hitTimes = hitTimes + 1
	_Brick_Hit(brickBody)
	pass

func _Brick_Hit(body):
	#Sprawdzenie trafienia klocka
		if(body.HP-1<=0):
			body.beFree=true
		var tree=body.get_tree()
		$MusicBoundBrick.play()
		
#		#Sprawdzanie dead bossa
		var win=true
		for boss in tree.get_nodes_in_group("bricksBoss"):
			var  countBrick=float(0)
			var dead=true
			var nodeBoss
			for node in boss.get_children():
				if(node.is_in_group("brick")):
					if( node.is_in_group("Boss")):
						nodeBoss=node
					if(!node.beFree):
						dead=false
						win=false
					countBrick=countBrick+1
				
			if(dead && !boss._isDead()):
				boss.emit_signal("dead")
				if(nodeBoss!=null):
					nodeBoss.beFree=false
					nodeBoss.emit_signal("dead")
				
			#Sprawdzanie hit bossa
			if (body.get_parent() == boss && !boss._isDead() && ((countBrick-1)/boss.countBricks) <= float(boss.rangeHit)/float(3)):
				var childrenIsBoss=null
				var maxHP=1
				for children in boss.get_children():
					if(children.is_in_group("Boss")):
						boss.hpBoss=float(children.HP)
						maxHP=float(children.maxHP)
						childrenIsBoss=children
					elif(children.is_in_group("brick")):
						_changeColorBricks(children,boss.rangeHit-1)
				if(childrenIsBoss==null || (childrenIsBoss!=null && float(boss.hpBoss)/float(maxHP)<=float(boss.rangeHit)/float(3))):
					boss.emit_signal("hitBoss")
					if(childrenIsBoss!=null):
						childrenIsBoss._hitBoss()

		if(win):
			get_tree().root.get_tree().get_nodes_in_group("Level")[0].emit_signal("showWin")

func _reset():
	self.linear_velocity=Vector2(0,0)
	self.angular_velocity=0
	self.global_translate(_initial_position)

func _on_Ball_paddleMove(pos):
	if (starting):
		paddlePosition=pos

func _changeColorBricks(brick,indexColor):
	brick.emit_signal("changeColor",indexColor)
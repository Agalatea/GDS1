extends RigidBody2D

export (float) var paddleSpeedFactor  #export (float) var boundSpeecFactor # 
signal paddleHit(paddlePosition)
signal rightBoundHit
signal leftBoundHit
signal topBoundHit

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

var _initial_position

func _ready():
    _initial_position = get_global_transform().origin
    self.set_physics_process(true)
#    connect("paddleHit", self, "_on_Ball_paddleHit")
    hide()

func _process(delta):
	pass
	
func _integrate_forces(state):
	if linear_velocity.y > 600:
		linear_velocity.y=600
	elif linear_velocity.y < -600:
		linear_velocity.y=-600
	if linear_velocity.x > 300:
		linear_velocity.x = 300
	elif linear_velocity.x < -300:
		linear_velocity.x = -300
#	elif linear_velocity.x >0 and linear_velocity.x < 30:
#		linear_velocity.x = 30
#	elif linear_velocity.x <0 and linear_velocity.x > -30:
#		linear_velocity.x = -30 
#	print ("LI  "+ str(linear_velocity))

func start(pos):
    position=pos
    show()
    $CollisionShape2D.disabled = false



func _on_Ball_paddleHit(paddlePosition):
	print ("BALL HIT with paddle "  )
	print ("Mid of Paddle position" + str(paddlePosition) )
	print ("_on_Ball_paddleHit linear_velocity " + str(linear_velocity))
	var modY = linear_velocity.y * 0.05;
	var ImpulsePoint = Vector2 (0, $CollisionShape2D.shape.radius/2)
	var positionDiffrence = position.x - paddlePosition.x 
	var factor = 3
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
	print (" _on_Ball_rightBoundHit linear_velocity " + str(linear_velocity))
	var ImpulsePoint = Vector2 (0, $CollisionShape2D.shape.radius/2)
	if (linear_velocity.y >= 0):  #going down
		apply_impulse(ImpulsePoint, Vector2(-5, 2.5 * paddleSpeedFactor))
	else: #going up
		apply_impulse(ImpulsePoint, Vector2(-5, -2.5 * paddleSpeedFactor))


func _on_Ball_leftBoundHit():
	print ("_on_Ball_leftBoundHit linear_velocity " + str(linear_velocity))
	var ImpulsePoint = Vector2 (0, $CollisionShape2D.shape.radius/2)
	if (linear_velocity.y >= 0):  #going down
		apply_impulse(ImpulsePoint, Vector2(5, 2.5 * paddleSpeedFactor))
	else: #going up
		apply_impulse(ImpulsePoint, Vector2(5, -2.5 *paddleSpeedFactor ))
		
func _on_Ball_topBoundHit():
	print ("_on_Ball_topBoundHit linear_velocity " + str(linear_velocity))
	var ImpulsePoint = Vector2 (0, $CollisionShape2D.shape.radius/2)
	apply_impulse(ImpulsePoint, Vector2(linear_velocity.x * 0.05, linear_velocity.y *-0.05))


#Sprawdzanie czy pilka odbila sie od brick i czy wszystkieklocki zostaly zbite
func _on_Ball_body_entered(body):
	_Brick_Hit(body)

func _Brick_Hit(body):
	#Sprawdzenie trafienia klocka
	if(body.is_in_group("brick")):
		var tree=body.get_tree()
		body.get_parent().get_parent().emit_signal("hitBoss")
		body.get_parent().free()
		get_tree().current_scene.get_node(".").emit_signal("addScorePoints")
		
		#Sprawdzanie bossa
		for boss in tree.get_nodes_in_group("bricksBoss"):
			var dead=true
			for node in boss.get_children():
				if(node.is_in_group("brick")):
					dead=false
					break
			if(dead && !boss._isDead()):
				boss.emit_signal("dead")
		
		#Sprawdzanie wygranej
		if(tree.get_nodes_in_group("brick").size()==0):
			get_tree().current_scene.get_node(".").emit_signal("showWin")

func _reset():
	self.linear_velocity=Vector2(0,0)
	self.angular_velocity=0
	self.global_translate(_initial_position)
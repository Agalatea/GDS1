extends RigidBody2D

export (float) var paddleSpeedFactor  #velocity will be applied with what factor
signal paddleHit(paddlePosition)
signal rightBoundHit
signal leftBoundHit
# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
    connect("paddleHit", self, "_on_Ball_paddleHit")
    hide()

func _process(delta):
    pass

func start(pos):
    position = pos
    show()
    $CollisionShape2D.disabled = false



func _on_Ball_paddleHit(paddlePosition):
	print ("BALL HIT with paddle "  )
	print ("Mid of Paddle position" + str(paddlePosition) )
	var ImpulsePoint = Vector2 (0, $CollisionShape2D.shape.radius/2)
	var positionDiffrence = position.x - paddlePosition.x 
	print ("positionDiffrence " + str(positionDiffrence))
	if (position.x - paddlePosition.x < -25 ): #left side
		apply_impulse(ImpulsePoint, Vector2(-1,-0.5 * paddleSpeedFactor))
		print ("case 1")
	elif (position.x - paddlePosition.x < -20 ): #left side
		apply_impulse(ImpulsePoint, Vector2(-1,-1 * paddleSpeedFactor))
		print ("case 2")
	elif (position.x - paddlePosition.x < -15 ): #left side
		apply_impulse(ImpulsePoint, Vector2(-1,-1.5 * paddleSpeedFactor))
		print ("case 3")
	elif (position.x - paddlePosition.x < -10 ): #left side
		apply_impulse(ImpulsePoint, Vector2(-1,-2 * paddleSpeedFactor))
		print ("case 4")
	elif (position.x - paddlePosition.x < 0 ): #left side
		apply_impulse(ImpulsePoint, Vector2(-1,-2.5 * paddleSpeedFactor))
		print ("case 5")
	elif (position.x - paddlePosition.x > 25 ): #right side
		apply_impulse(ImpulsePoint, Vector2(1,-0.5 * paddleSpeedFactor))
		print ("case 6")
	elif (position.x - paddlePosition.x > 20 ): #right side
		apply_impulse(ImpulsePoint, Vector2(1,-1) * paddleSpeedFactor)
		print ("case 7")
	elif (position.x - paddlePosition.x > 15 ): #right side
		apply_impulse(ImpulsePoint, Vector2(1,-1.5 * paddleSpeedFactor))
		print ("case 8")
	elif (position.x - paddlePosition.x > 10 ): #right side
		apply_impulse(ImpulsePoint, Vector2(1,-2 * paddleSpeedFactor))
		print ("case 9")
	elif (position.x - paddlePosition. x >= 0 ): #right side
		apply_impulse(ImpulsePoint, Vector2(1, -2.5 * paddleSpeedFactor))
		print ("case 10")




func _on_Ball_rightBoundHit():
	var ImpulsePoint = Vector2 (0, $CollisionShape2D.shape.radius/2)
	apply_impulse(ImpulsePoint, Vector2(-5, 0))


func _on_Ball_leftBoundHit():
	var ImpulsePoint = Vector2 (0, $CollisionShape2D.shape.radius/2)
	apply_impulse(ImpulsePoint, Vector2(5, 0))

#Sprawdzanie czy pilka odbila sie od brick i czy wszystkieklocki zostaly zbite
func _on_Ball_body_entered(body):
	if(body.is_in_group("brick")):
		var tree=body.get_tree()
		body.get_parent().free()
		if(tree.get_nodes_in_group("brick").size()==0):
			get_tree().current_scene.get_node(".").emit_signal("showWin")

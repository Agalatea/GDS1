extends RigidBody2D


signal paddleHit
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



func _on_Ball_paddleHit():
	print ("BALL HIT with paddle "  )
	var ImpulsePoint = Vector2 (0, $CollisionShape2D.shape.radius/2)
	apply_impulse(ImpulsePoint, Vector2(0,-6))



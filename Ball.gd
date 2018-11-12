extends RigidBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
    hide()

func _process(delta):
     pass

func start(pos):
    position = pos
    show()
    $CollisionShape2D.disabled = false
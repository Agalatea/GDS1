#extends KinematicBody2D
extends Area2D


export (int) var speed  # How fast the player will move (pixels/sec).
var xMin
var xMax

func _ready():    
    hide()

func _process(delta):
    var velocity = Vector2(0,0) # The player's movement vector.
    if Input.is_action_pressed("ui_right") && position.x <= xMax:
            velocity.x += 1
    if Input.is_action_pressed("ui_left") && position.x >= xMin:
        velocity.x -= 1
    if velocity.length() > 0:
        velocity = velocity.normalized() * speed
        $AnimatedSprite.play()
    #else:
        #$AnimatedSprite.stop()
    position += velocity * delta

    if velocity.x != 0:
        $AnimatedSprite.animation = "right"
        $AnimatedSprite.flip_v = false
        $AnimatedSprite.flip_h = velocity.x < 0

   
func start(pos, xMin, xMax):
    self.xMin = xMin + $CollisionShape2D.shape.extents.x/2   #so paddle does not leave bounds
    self.xMax = xMax - $CollisionShape2D.shape.extents.x/2
    position = pos
    show()
    $CollisionShape2D.disabled = false




func _on_Paddle_body_entered(body):
    var position = body.position #or body.get_pos()
    print("collision position: ", str(position))
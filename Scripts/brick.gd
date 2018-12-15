extends Area2D

var beFree = false

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _process(delta):
	# Called every frame. Delta is time since last frame.
	# Update game logic here.
	if(beFree):
		free()
	pass


func _on_brick_body_entered(body):
	var position = body.position #or body.get_pos()
	print("_on_brick_body_entered collision position: ", str(position))
	if (body.get_name() == "Ball"):
		body.emit_signal("brickHit", self )
	beFree = true
	


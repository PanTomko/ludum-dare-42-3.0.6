extends KinematicBody2D

export(float) var speed
var movment = Vector2(0,0)
var active = true

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _physics_process(delta):
	
	# input
	if active:
		if Input.is_action_pressed("ui_left"):
			movment.x -= speed * delta
		elif Input.is_action_pressed("ui_right"):
			movment.x += speed * delta
	
	# move
	move_and_collide( movment )
	
	# clear 
	movment.x = 0
	movment.y = 0
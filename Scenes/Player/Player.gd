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
			
			if $AnimationPlayer.current_animation != "Walk_left":
				$AnimationPlayer.play("Walk_left")
			
		elif Input.is_action_pressed("ui_right"):
			movment.x += speed * delta
			
			if $AnimationPlayer.current_animation != "Walk_right":
				$AnimationPlayer.play("Walk_right")
	
	
	if movment.x == 0 :
		if $AnimationPlayer.current_animation != "Iddle":
			$AnimationPlayer.play("Iddle")
	# move
	move_and_collide( movment )
	
	# clear 
	movment.x = 0
	movment.y = 0
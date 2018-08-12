extends KinematicBody2D

# data
export(float) var speed
var movment = Vector2(0,0)
var active = true
var current_stage

func _ready():
	set_stage( "Stage_01" )
	pass

func set_stage( stage_name ) :
	current_stage = get_parent().get_node( stage_name )
	#get_parent().get_node( stage_name ).set_stage()
	
	#get_node("Camera2D").limit_left = current_stage.map_size.x
	#get_node("Camera2D").limit_right = current_stage.map_size.y
	pass
	#current_stage
	

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
extends KinematicBody2D

const UP = Vector2(0, -1)

var speed = 260
var motion = Vector2(0,0)
var accumulate_motion = Vector2(0,0)
var jump_strenght = 325

# forces
var gravity_force = Vector2(0,392)

func _ready():
	pass

func _physics_process(delta):
	# applay force that accumulate
	accumulate_motion += gravity_force * delta
	
	# movment control
	if Input.is_action_pressed("ui_right"):
		motion.x += speed
		if get_node("AnimationPlayer").current_animation != "Walk_right":
			get_node("AnimationPlayer").play("Walk_right")
	elif Input.is_action_pressed("ui_left"):
		motion.x -= speed
		if get_node("AnimationPlayer").current_animation != "Walk_left":
			get_node("AnimationPlayer").play("Walk_left")
	else:
		motion.x = 0
		get_node("AnimationPlayer").play("Iddle")
	
	if is_on_ceiling():
		accumulate_motion.y = 0
		motion.y = 0
	
	if is_on_floor():
		if Input.is_action_just_pressed("ui_up"):
			get_node("AnimationPlayer").play("Jump")
			accumulate_motion.y -= jump_strenght
	
	# applay motion and reset it
	move_and_slide( motion + accumulate_motion, UP)
	
	if is_on_floor():
		accumulate_motion.y = 0
	
	motion = Vector2(0,0)
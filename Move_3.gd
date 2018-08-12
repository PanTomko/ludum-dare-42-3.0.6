extends Node

const UP = Vector2(0, -1)

var speed = -100
var motion = Vector2(0,0)
var accumulate_motion = Vector2(0,0)
var jump_strenght = 250

# forces
var gravity_force = Vector2(0,392)

func _ready():
	pass

func _physics_process(delta):
	# applay force that accumulate
	motion.x += speed
	
	if get_parent().is_on_ceiling():
		accumulate_motion.y = 0
		motion.y = 0
	
	# applay motion and reset it
	get_parent().move_and_slide( motion + accumulate_motion, UP)
	
	if get_parent().is_on_floor():
		accumulate_motion.y = 0
	
	
	motion = Vector2(0,0)
	if get_node("../AnimationPlayer").current_animation != "jump":
		get_node("../AnimationPlayer").play( "jump" )
	
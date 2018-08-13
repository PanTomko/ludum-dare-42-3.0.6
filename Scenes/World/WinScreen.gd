extends CenterContainer

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
func _input(event):
	if event is InputEventKey and event.pressed && !($AnimationPlayer.is_playing()):
		if Input.is_action_just_pressed( "ui_up" ):
			get_parent().bring_menu( 0 )
			get_parent().remove_winScreen()

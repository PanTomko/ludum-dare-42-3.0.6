extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _process(delta):
	if Input.is_action_just_pressed( "ui_menu" ):
		var parent = get_parent()
		parent.bring_menu( 1 )
		parent.remove_game()
	
	if $Player.position.x > 9750:
		#$Player.position.x = 217
		get_parent().game_won()
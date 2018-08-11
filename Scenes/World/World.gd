extends Node

# No time to do it raight way !!!! BADDDDDDDDDDD VERYYYY BADDDD DO NOT COPY CODE !!!!!!!!
var game_node
var GUI_node
var menu

func _ready():
	pass

func _process(delta):
	
	if Input.is_action_just_pressed( "ui_menu" ):
		if has_node("Game"):
			game_node = get_node("Game")
			GUI_node = get_node("GUI")
			remove_child( get_node("Game") )
			remove_child( get_node("GUI") )
		else:
			add_child( game_node )
			add_child( GUI_node )
extends Node

# No time to do it raight way !!!! BADDDDDDDDDDD VERYYYY BADDDD DO NOT COPY CODE !!!!!!!!
var game_node
var GUI_node
var menu_node

func _ready():
	menu_node = get_node("Menu")
	remove_game()

func _process(delta):
	

#		else:
#			bring_game()
#			remove_menu()
	pass

func remove_game():
	game_node = get_node("Game")
	GUI_node = get_node("GUI")
	remove_child( get_node("Game") )
	remove_child( get_node("GUI") )

func bring_game():
	add_child( game_node )
	add_child( GUI_node )

func remove_menu():
	menu_node = get_node("Menu")
	remove_child( get_node("Menu") )

func bring_menu( mode ):
	menu_node.get_child(0).set_mode( mode )
	add_child( menu_node )
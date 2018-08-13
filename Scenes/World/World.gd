extends Node

# No time to do it raight way !!!! BADDDDDDDDDDD VERYYYY BADDDD DO NOT COPY CODE !!!!!!!!
var game_node
var GUI_node
var menu_node
var gameOver_node
var winScreen_node
var credit_node

func _ready():
	menu_node = get_node("Menu")
	remove_game()
	remove_gameOver()
	remove_winScreen()

#func _process(delta):
#
#
#
##		else:
##			bring_game()
##			remove_menu()
#	pass

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

func remove_gameOver():
	gameOver_node = get_node("GameOverScreen")
	remove_child( get_node("GameOverScreen") )

func bring_gameOver():
	add_child( gameOver_node )

func remove_winScreen():
	winScreen_node = get_node("WinScreen")
	remove_child( get_node("WinScreen") )

func bring_winScreen():
	add_child( winScreen_node )

func remove_credits():
	credit_node = get_node("Credits")
	remove_child( get_node("Credits") )

func bring_credits():
	add_child(credit_node)

func game_over():
	get_node("Eaten").play()
	bring_gameOver()
	remove_game()
	reload_game()
	get_node("GameOverScreen/AnimationPlayer").play("Show")

func game_won():
	bring_winScreen()
	remove_game()
	reload_game()
	get_node("WinScreen/AnimationPlayer").play("Show")

func reload_game():
	game_node = preload("res://Game/Game.tscn").instance()
	GUI_node = preload("res://Scenes/Dialoge/GUI.tscn").instance()
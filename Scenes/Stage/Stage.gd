extends Node2D

var player_node
var GUI_node

# x-min y-max
var map_size = Vector2()

func _ready():
#	player_node = get_parent().get_node("Player")
	map_size.x = get_node("MinMax/Min").global_position.x
	map_size.y = get_node("MinMax/Max").global_position.x
	print("lul")
#	GUI_node = get_parent().get_parent().get_node("GUI")
#
#	print(GUI_node.name)
#	print(player_node.name)
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

func set_stage():
	print("set")
	map_size.x = get_node("MinMax/Min").global_position.x
	map_size.y = get_node("MinMax/Max").global_position.x
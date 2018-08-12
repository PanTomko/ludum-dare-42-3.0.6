extends CanvasLayer

var player

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func game_over():
	get_node("CenterContainer").show()
	get_node("Dialog").hide()
#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

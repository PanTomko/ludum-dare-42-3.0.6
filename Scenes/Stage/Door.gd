extends Area2D

var name_of_conected_stage = ""
var can_go = false

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass


func _on_Door_body_shape_entered(body_id, body, body_shape, area_shape):
		
	if body.name == "Player" :
		var game = get_parent().get_parent().get_parent()
		game.game_won()

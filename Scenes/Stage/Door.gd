extends Area2D

var name_of_conected_stage = ""
var can_go = false

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _process(delta):
	pass


func _on_Door_body_shape_entered(body_id, body, body_shape, area_shape):
	pass
	#if body.name == "Player" :
	#	print("hmm")
	#	var game = get_parent().get_parent().get_parent()
	#	game.game_won()

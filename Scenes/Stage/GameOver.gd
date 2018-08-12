extends Area2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _process(delta):
	position.x += delta * 190


func _on_GameOver_body_shape_entered(body_id, body, body_shape, area_shape):
	
	if body.name == "Player" :
		var game = get_parent().get_parent().get_parent()
		game.game_over()
		

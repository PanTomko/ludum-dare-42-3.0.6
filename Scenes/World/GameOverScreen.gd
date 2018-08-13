extends CenterContainer

func _ready():
	pass

func _input(event):
	if event is InputEventKey and event.pressed && !($AnimationPlayer.is_playing()):
		get_parent().bring_menu( 0 )
		get_parent().remove_gameOver()
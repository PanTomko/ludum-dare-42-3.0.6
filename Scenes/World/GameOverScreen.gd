extends CenterContainer

func _ready():
	pass

func _input(event):
	if event is InputEventKey and event.pressed && !($AnimationPlayer.is_playing()):
		
		if !Input.is_key_pressed(KEY_SPACE) and !Input.is_key_pressed(KEY_ENTER):
			get_parent().bring_menu( 0 )
			get_parent().remove_gameOver()
extends CenterContainer

func _ready():
	pass

func _input(event):
	if event is InputEventKey and event.pressed && !($AnimationPlayer.is_playing()):
		
		if Input.is_action_just_pressed( "ui_up" ):
			get_parent().bring_menu( 0 )
			get_parent().remove_gameOver()
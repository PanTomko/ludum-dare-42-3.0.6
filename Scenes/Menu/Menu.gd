extends Control

# data
var max_item = 3
var selected_item_id = 0
var mode = 0

func _ready():
	set_highlight_item( 2 )

func _process(delta):
	
	if Input.is_action_just_pressed( "ui_up" ):
		set_highlight_item( selected_item_id - 1 )
	elif Input.is_action_just_pressed( "ui_down" ):
		set_highlight_item( selected_item_id + 1 )
	elif Input.is_action_just_pressed( "ui_accept" ):
		
		var item_text = get_node("CenterContainer/MenuOptions").get_child( selected_item_id ).name
		
		if item_text == "OptionNewGame" :
			var parent = get_parent().get_parent()
			parent.bring_game()
			parent.remove_menu()
		elif item_text == "OptionContinue" :
			var parent = get_parent().get_parent()
			parent.bring_game()
			parent.remove_menu()
		elif item_text == "OptionExit":
			get_tree().quit()

func set_highlight_item( value ):
	if get_node("CenterContainer/MenuOptions").get_child_count() > value && value >= 0 :
		if get_node("CenterContainer/MenuOptions").get_child( value ).visible :
			
			$AudioStreamPlayer.play()
			
			get_node("CenterContainer/MenuOptions").get_child( value ).modulate = Color( "#bab83b" )
			get_node("CenterContainer/MenuOptions").get_child( selected_item_id ).modulate = Color( "#ffffff" )
			selected_item_id = value
			
		else:
			if value > selected_item_id :
				set_highlight_item( value + 1 )
			elif value < selected_item_id :
				set_highlight_item( value - 1 )
			else:
				print("Error menu !")

func set_mode( mode ):
	if mode == 0:
		get_node( "CenterContainer/MenuOptions/OptionContinue" ).visible = false
		get_node( "CenterContainer/MenuOptions/OptionNewGame" ).visible = true
		set_highlight_item( 2 )
	elif mode == 1:
		get_node( "CenterContainer/MenuOptions/OptionContinue" ).visible = true
		get_node( "CenterContainer/MenuOptions/OptionNewGame" ).visible = false
		set_highlight_item( 2 )
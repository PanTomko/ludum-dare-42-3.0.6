extends Control

# Lines we can display
var lines = {
	"wazon" : [ 
		"Runnnnnnnnnn!",
	 	"Try to avoid those crazy ass cats.",
	 	"Get to the door on the other side of the room quick!"
	],
	
	"wazon2" : [ 
		"meow, meow, meow, meow, meow, meow, meow, meow",
		"meow, meow, meow, meow, meow, meow, meow, meow",
		"meow, meow, meow, meow, meow, meow, meow, meow",
		"meow, meow, meow, meow, meow, meow, meow, meow",
		"meow, meow, meow, meow, meow, meow, meow, meow",
		"meow, meow, meow, meow, meow, meow, meow, meow",
		"meow, meow, meow, meow, meow, meow, meow, meow",
		"meow, meow, meow, meow, meow, meow, meow, meow",
		"meow, meow, meow, meow, meow, meow, meow, meow",
		"meow, meow, meow, meow, meow, meow, meow, meow",
		"meow, meow, meow, meow, meow, meow, meow, meow",
		"meow, meow, meow, meow, meow, meow, meow, meow",
		"meow, meow, meow, meow, meow, meow, meow, meow",
		"meow, meow, meow, meow, meow, meow, meow, meow",
		"meow, meow, meow, meow, meow, meow, meow, meow",
		"meow, meow, meow, meow, meow, meow, meow, meow",
		"meow, meow, meow, meow, meow, meow, meow, meow",
		"meow, meow, meow, meow, meow, meow, meow, meow",
		"meow, meow, meow, meow, meow, meow, meow, meow",
		"meow, meow, meow, meow, meow, meow, meow, meow"
	]
}

#current line being displayed
var current_lines = ""

var plaing_line = false
var plaing_lines = false

var active = false

func _ready():
	pass

func _process(delta):
	
	if plaing_lines && active:
		# play next or skipp curren line !
		if Input.is_action_just_pressed( "ui_accept"):
			if plaing_line:
				skip_line_animation()
			else:
				$AutoLine.stop()
				next_line()

# 
func skip_line_animation():
	$DialogLine2.text = $DialogLine2.text_to_show


# Set next line
func next_line():
	if !lines[current_lines].empty():
		$DialogLine2.set_text_to_show( lines[current_lines].pop_front() ) # play next line
		if lines[current_lines].empty():
			$DialogLine2.last_line = true
		else:
			$DialogLine2.last_line = false
	else :
		on_lines_ends( current_lines )
		

# Set lines to display !
func play_lines( name_of_lines ):
	current_lines = name_of_lines
	plaing_lines = true
	
	active = true
	
	next_line()
	modulate = Color("#ffd8d9ba")

# Line from current line ended !
func _on_DialogLine2_line_ended( is_last ):
	plaing_line = false
	
	# chek if no more lines to diplay
	if lines[current_lines].empty():
		
		# make option if need
		match current_lines:
			"lul" :
				$AutoLine.stop()
				get_node("../Decision").make_decision( current_lines )

# if player waits to long go for next line !
func _on_AutoLine_timeout():
	next_line()
	$AutoLine.stop()

func on_lines_ends( lines_name ):
	
	plaing_lines = false
	
	match lines_name:
		"lul" :
			pass
			#play_lines( "conti" )
		_:
			if plaing_lines == false:
				fade_lines()

func fade_lines():
	$AnimationPlayer.play("fade")
	$NextLetterTimer.stop()
	$AutoLine.stop()

func _on_Decision_decision_over( decision_name_siganl ):
	fade_lines()

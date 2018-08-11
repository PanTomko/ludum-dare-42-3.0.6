extends Label

signal line_ended( is_last )

var counter_for_sound = 2
var curren_counter = 0
var text_to_show = "Cool text bro"
var last_line = false

func _ready():
	text = ""
		

func set_text_to_show( text_n ):
	curren_counter = 0
	text = ""
	text_to_show = text_n
	get_node("../NextLetterTimer").start()
	get_node("../AutoLine").stop()

func _on_NextLetterTimer_timeout():
	if text != text_to_show:
		
		text += text_to_show[curren_counter]
		
		# play sound
		if text_to_show[curren_counter] != " ":
			get_node("../SoundOnLetter").play()
		else:
			get_node("../SoundOnLetter").stop()
		
		curren_counter+=1
	else:
		get_node("../SoundOnLetter").stop()
		get_node("../NextLetterTimer").stop()
		if last_line == false:
			get_node("../AutoLine").start()
		
		emit_signal( "line_ended", last_line)

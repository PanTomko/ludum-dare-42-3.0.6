extends RichTextLabel

var text_size
#export var text_to_show = "Lul" # Maby to use will see

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

func _on_NextLetterTimer_timeout():
	if visible_characters < text.length():
		visible_characters +=1
		$NextLetterTimer.start()

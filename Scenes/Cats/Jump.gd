extends Timer

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	wait_time = range(1.5,4)[randi()%range(2,4).size()]

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

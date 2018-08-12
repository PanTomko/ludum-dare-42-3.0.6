extends Node2D

export(int) var id
var cats = []

func _ready():
	if id != 0:
		for i in get_children():
			if i.is_in_group("cats"):
				cats.push_back( i )
				remove_child( i )

func spawn():
	for i in cats:
		add_child( i )

func _process(delta):
	if get_node("../../GameOver").position.x > get_node("End").position.x:
		queue_free()
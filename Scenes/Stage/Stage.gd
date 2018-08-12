extends Node2D

var player_node
var GUI_node
var spawns = Array()
var id_spawn = 0
var current_spawner
var current_spawn = Vector2(0,0)
var max_id_spawner

# x-min y-max
var map_size = Vector2()

func _ready():
	max_id_spawner = get_node( "Spawners" ).get_child_count()
	set_spawn(0)

func _process(delta):
	if current_spawn.x < get_parent().get_node("Player").position.x:
		if max_id_spawner > id_spawn + 1:
			print(id_spawn + 1)
			set_spawn( id_spawn + 1 )

func set_spawn( id ):
	id_spawn = id
	current_spawner = get_node( "Spawners/Spawn" + str( id ) )
	current_spawn.x = current_spawner.get_node("Next").position.x
	current_spawner.spawn()
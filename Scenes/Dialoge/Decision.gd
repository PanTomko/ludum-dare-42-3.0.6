extends Control

# Siganls
signal decision_over

# option preload
var option_pack = preload("res://Scenes/Decision/DecisionOption.tscn")

# Data
var active = true
var active_option = 0
var previus_option = 0
var max_active_option = 0

var name_decision = ""

# Data for options that player teak and what oprion he have
var options = {
	"kuku_decision" : {
		"options" : ["lul2323eww", "lul2"],
		"took" : -1
	}
}


func _ready():
	make_decision( "kuku_decision" )
	pass

func make_decision( decision_name ):
	name_decision = decision_name
	var tmp_option
	for i in options[decision_name]["options"]:
		tmp_option = option_pack.instance()
		tmp_option.text = i
		get_node("HBoxContainer").add_child( tmp_option )
		max_active_option += 1
	
	get_node("Arrow").visible = true
	

func set_arrow():
	var pos = get_node("HBoxContainer").get_child(active_option).get_global_rect().position
	pos.y += 9
	pos.x -= 9
	get_node("Arrow").position = pos
	
	get_node("HBoxContainer").get_child(active_option).modulate = Color( "#bab83b" )
	if active_option != previus_option:
		get_node("HBoxContainer").get_child(previus_option).modulate = Color( "#ffffff" )
	
func _process(delta):
	if active:
		set_arrow()
		# Input
		if Input.is_action_just_pressed("ui_left"):
			if active_option - 1 >= 0:
				previus_option = active_option
				active_option -= 1
				set_arrow()
		elif Input.is_action_just_pressed("ui_right"):
			if active_option + 1 <= max_active_option -1 :
				previus_option = active_option
				active_option += 1
				set_arrow()
		elif Input.is_action_just_pressed("ui_accept"):
			options[name_decision]["took"] = active_option
			emit_signal("decision_over")
			clear_decision()

func clear_decision():
	pass

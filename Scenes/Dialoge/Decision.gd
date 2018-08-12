extends Control

# Siganls
signal decision_over(decision_name_siganl)

# option preload
var option_pack = preload("res://Scenes/Decision/DecisionOption.tscn")

# Data
var active = false
var active_option = 0
var previus_option = 0
var arrow_pos = -1
var max_active_option = 0

var name_decision = ""

# Data for options that player teak and what oprion he have
var options = {
	"wazon" : {
		"options" : ["Yes !", "No -_-"],
		"took" : -1
	}
}

func _ready():
	connect( "decision_over", self, "clear_decision" )

func make_decision( decision_name ):
	active = true
	name_decision = decision_name
	
	var tmp_option
	for i in options[decision_name]["options"]:
		tmp_option = option_pack.instance()
		tmp_option.text = i
		get_node("HBoxContainer").add_child( tmp_option )
		tmp_option.set_owner(get_tree().get_root())
		max_active_option += 1
	
	get_node("Arrow").visible = true
	
	#get_parent().get_parent().get_node("Game/Player").active = false

func set_arrow():
	arrow_pos = active_option
	var pos = get_node("HBoxContainer").get_child(active_option).get_global_rect().position
	pos += Vector2(-9, 9)
	get_node("Arrow").position = pos
		
	get_node("HBoxContainer").get_child(active_option).modulate = Color( "#bab83b" )
	if active_option != previus_option:
		get_node("HBoxContainer").get_child(previus_option).modulate = Color( "#ffffff" )

func set_action( value ):
	previus_option = active_option
	active_option = value
	$AudioStreamPlayer.play()

func _process(delta):
	if active:
		
		# !!!!!! BAD !!!!!!
		set_arrow()
		
		# Input
		if Input.is_action_just_pressed("ui_left"):
			if active_option - 1 >= 0:
				set_action( active_option - 1 )
		elif Input.is_action_just_pressed("ui_right"):
			if active_option + 1 <= max_active_option -1 :
				set_action( active_option + 1 )
		elif Input.is_action_just_pressed("ui_accept"):
			active = false
			get_node("TimerHighlight").start()
			get_node("Timer").start()
			get_node("HBoxContainer").get_child(active_option).modulate = Color( "#f9ff42" )

func clear_decision( decision_name_siganl ):
	print("clear_decision")
	get_node("Arrow").visible = false
	active_option = 0
	previus_option = 0
	max_active_option = 0
	arrow_pos = -1
	name_decision = ""
	
	for i in get_node("HBoxContainer").get_children():
		i.queue_free()
	
	get_parent().get_parent().get_node("Game/Player").active = true

func _on_TimerHighlight_timeout():
	get_node("Timer").stop()
	get_node("TimerHighlight").stop()
	options[name_decision]["took"] = active_option
	emit_signal("decision_over", name_decision)

func _on_Timer_timeout():
	if get_node("HBoxContainer").get_child(active_option).modulate == Color( "#bab83b" ):
		get_node("HBoxContainer").get_child(active_option).modulate = Color( "#f9ff42" )
	elif get_node("HBoxContainer").get_child(active_option).modulate == Color( "#f9ff42" ):
		get_node("HBoxContainer").get_child(active_option).modulate = Color( "#bab83b" )

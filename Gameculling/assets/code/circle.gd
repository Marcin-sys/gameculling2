extends Spatial

const cube_scene = preload("res://scenes/cube.tscn")
const cylinder_scene = preload("res://scenes/cylinder.tscn")
const sphere_scene = preload("res://scenes/sphere.tscn")

onready var node_generator = get_node('spawner_circle')

var rng = RandomNumberGenerator.new()  			# Make seed for number.
var my_object_id
var time_when_disappear


func _ready():
	var time_now
	time_when_disappear = node_generator.time_disappear()
	time_now = node_generator.process()
	time_when_disappear += time_now



func _process(_delta):
	var what_time_now
	what_time_now = node_generator.process()

	if time_when_disappear < what_time_now:
		print("jestem obiektem nr:     i wsłaśnie umarłem")

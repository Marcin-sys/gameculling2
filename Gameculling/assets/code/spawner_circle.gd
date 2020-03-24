extends Spatial

const cube_scene = preload("res://scenes/cube.tscn")
const cylinder_scene = preload("res://scenes/cylinder.tscn")
const sphere_scene = preload("res://scenes/sphere.tscn")
#onready var _self = get_node("res://assets/code/spawner_circle.gd")

# Circle
const radius = 20								# Circle radius 
const center = Vector3(0, 0, 0)					# Circle center
const count_segments = 20						# How much of an angle objects will be spaced around the circle.
const angle_step = 2.0 * PI / count_segments	# 2.0*PI = 360 degrees  / segments

# Number of object's
var node_counter 								# For counting the number of objects on the screen
var number_of_object_can_spawn					# Random number from MIN to MAX that can spawn inside of circle
const NUMBER_OF_OBJECT_MAX = 20					# MAX number of object that can spawn inside circle
const NUMBER_OF_OBJECT_MIN = 10					# MIN number of object that can spawn inside circle
var temporary = Generator.new()
var rng = RandomNumberGenerator.new()  			# Make seed for number.
var scenes									# Make scenes of object's.
var store_flag = [] 						# Store position of spawned object
var scene_objects_dict = {}
var last_dict_id = 0

# Time limit's
const TIME_SPAN_MAX = 4							# Time period MAX till function spawn another object
const TIME_SPAN_MIN = 1	      					# Time period MIN till function spawn another object
var TIME_SPAN									# Time period till function spawn another object
var time_left = 0								# Timer

func time_to_disappear():
	return rng.randi_range(1, 10)

func check_if_there_is_something_in_this_place(position_object_edge_circle):
	
	if not position_object_edge_circle in store_flag:
		
		store_flag.append(position_object_edge_circle)
		print("storage is:", store_flag)
		return "There is nothing in this position" 
	return "There is something in this position"

func generate_object():
	var posible_angle = [0]
	for i in range(1, count_segments):
		var count_angle = i * angle_step
		posible_angle.append(count_angle)
	var angle_random = posible_angle[randi() % posible_angle.size()]  # Random angle for object
		
	var direction = Vector3(cos(angle_random), 0, sin(angle_random))
	var position_object_edge_circle = center + direction * radius
	if check_if_there_is_something_in_this_place(position_object_edge_circle) == "There is nothing in this position":
		var scenes = [cube_scene, cylinder_scene, sphere_scene]
		
		var temporary_object = scenes[randi() % scenes.size()].instance()
		temporary_object.set_translation(position_object_edge_circle)
	
		return temporary_object
	else:
		pass

func add_scene_object_to_dict(object):
	scene_objects_dict[last_dict_id] = object
	last_dict_id += 1

func _ready():
	rng.randomize()
	TIME_SPAN = rng.randi_range(TIME_SPAN_MIN, TIME_SPAN_MAX)
	# Called every frame. 'delta' is the elapsed time since the previous frame.

func process(delta):
	
	time_left += delta
	if time_left > TIME_SPAN:
		# Random time
		TIME_SPAN = rng.randi_range(TIME_SPAN_MIN, TIME_SPAN_MAX)
		print('Time to next spawn:', TIME_SPAN, 's')
		# Reset time_left.
		time_left = 0
		var temp = temporary.generate_object()
		# If in time limit nothing spawn then fast forward. 
		if temp == null:
			TIME_SPAN = 0
		Generator.add_scene_object_to_dict(temp)
		self.add_child(temp)
	else:
		pass
	
	var time_now = delta
	return time_now

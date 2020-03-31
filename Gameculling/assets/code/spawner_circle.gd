extends Spatial

const cube_scene = preload("res://scenes/cube.tscn")
const cylinder_scene = preload("res://scenes/cylinder.tscn")
const sphere_scene = preload("res://scenes/sphere.tscn")

# Time limit's
const TIME_SPAN_MAX = 1							# Time period MAX till function spawn another object
const TIME_SPAN_MIN = 1	      					# Time period MIN till function spawn another object
var TIME_SPAN									# Time period till function spawn another object
var time_left = 0								# Timer
const SET_TIME_TO_DEATH_MAX = 25
const SET_TIME_TO_DEATH_MIN = 10

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

var temporary
var rng = RandomNumberGenerator.new()  			# Make seed for number.

var store_flag = [] 							# Store position of spawned object
var position_object_edge_circle

var position_array = []
var number_objects_in_scene = 0
var random_position_id

func generate_array():
	for i in range(count_segments): # generate array with posible position for count_segments
		position_array.append(Vector3(cos(i), 0, sin(i)) * radius + center)
		store_flag.append(null)

func generate_object():
	random_position_id = rng.randi_range(0, position_array.size() - 1)  # Random position for object

	if store_flag[random_position_id] == null:

		var position_for_temp = position_array[random_position_id]  # Position for temp
		var scenes = [cube_scene, cylinder_scene, sphere_scene]

		var temporary_object = scenes[randi() % scenes.size()].instance()
		temporary_object.set_translation(position_for_temp)

		store_flag[random_position_id] = 1 # change null to 1 in store_flag [random_position_id]

		return temporary_object
	else:
		return null

func on_Timer_timeout(id, ref):
	if number_objects_in_scene > NUMBER_OF_OBJECT_MIN:
		store_flag[id] = null   # clear the position in store_flag
		number_objects_in_scene -= 1
		ref.death()
		print("ilosc obiektow: ", number_objects_in_scene)

func _ready():
	generate_array()
	rng.randomize()
	TIME_SPAN = rng.randi_range(TIME_SPAN_MIN, TIME_SPAN_MAX)
	print("Time to first spawn:", TIME_SPAN, "s")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):

	#rotation
	self.global_rotate(Vector3(0, 1, 0), delta)
	#print(self.rotation_degrees)

	time_left += delta

	if time_left > TIME_SPAN:
		# Random time
		TIME_SPAN = rng.randi_range(TIME_SPAN_MIN, TIME_SPAN_MAX)

		# Reset time_left.
		time_left = 0

		var temp = generate_object()

		# If in time limit nothing spawn then fast forward.
		if temp == null:
			TIME_SPAN = 0
		elif number_objects_in_scene < NUMBER_OF_OBJECT_MAX:
			number_objects_in_scene += 1 # count objects
			print("Time to next spawn:", TIME_SPAN, "s")
			self.add_child(temp)
			print(get_tree())
			temp.set_time_to_death(rng.randi_range(SET_TIME_TO_DEATH_MIN, SET_TIME_TO_DEATH_MAX))
			temp.my_object_id(random_position_id)
			temp.connect("timeout", self, "on_Timer_timeout")
			print('ilosc obiektow: ', number_objects_in_scene)
		else:
			pass
	else:
		pass



extends Node

var cube_scene = preload("res://scenes/cube.tscn")
var cylinder_scene = preload("res://scenes/cylinder.tscn")
var sphere_scene = preload("res://scenes/sphere.tscn")

var node_counter = 0						# For counting the number of objects on the screen
var TIME_SPAN_MAX = 4						# Time period MAX till function spawn another object
var TIME_SPAN_MIN = 1	      				# Time period MIN till function spawn another object
var TIME_SPAN								# Time period till function spawn another object
var time_left = 0							# Timer
var rng = RandomNumberGenerator.new()  		# Make seed for number.
var scenes									# Make scenes of object's.

#Circle
var radius = 20								# Circle radius 
var center = Vector3(0, 0, 0)				# Circle center
var count_segments = 20						# How much of an angle objects will be spaced around the circle.
var angle_step = 2.0 * PI / count_segments	# 2.0*PI = 360 degrees  / segments
var angle_random							# Random angle for object
var posible_angle = [0]
var count_angle
var store_flag = []							# Store position of spawned object
var number_of_object_can_spawn				# Random number from MIN to MAX that can spawn inside of circle
var number_of_object_MAX = 20				# MAX number of object that can spawn inside circle
var number_of_object_MIN = 10				# MIN number of object that can spawn inside circle
var diffrence_in_number_of_object
var random_flag								# Random flag in storage
var object_to_remove


func _ready():
	rng.randomize()

	scenes = [cube_scene, cylinder_scene, sphere_scene] 

	for i in range(1, count_segments):
		count_angle = i * angle_step
		posible_angle.append(count_angle)

	TIME_SPAN = rng.randi_range(TIME_SPAN_MIN, TIME_SPAN_MAX)



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	time_left += delta
	
	scenes = [cube_scene, cylinder_scene, sphere_scene] 


	if time_left > TIME_SPAN:
		# Random time
		TIME_SPAN = rng.randi_range(TIME_SPAN_MIN, TIME_SPAN_MAX)
		print('Time to next spawn:', TIME_SPAN, 's')
		# Reset time_left.
		time_left = 0

		# Random angle
		angle_random = posible_angle[randi() % posible_angle.size()]
		print(angle_random)

		# Position
		var direction = Vector3(cos(angle_random), 0, sin(angle_random))
		var position_object_edge_circle = center + direction * radius
		
		# If  there is no object in position -> you can spawn. 
		if not position_object_edge_circle in store_flag:
			
			# Add position
			store_flag.append(position_object_edge_circle)
			print(store_flag)
			
			# Spawn random scenes
			var temporary_object = scenes[randi() % scenes.size()].instance()
			temporary_object.set_translation(position_object_edge_circle)
			self.add_child(temporary_object)


			# # Random of object in scene
			# number_of_object_can_spawn = rng.randi_range(number_of_object_MIN, number_of_object_MAX)
			# print('How many object can be on scene:', number_of_object_can_spawn)
			# # If there is to many object 
			# if store_flag.size() > number_of_object_can_spawn:
			# 	diffrence_in_number_of_object = store_flag.size() - number_of_object_can_spawn
			# 	for _i in range(0, diffrence_in_number_of_object):
			# 		print('removing object!!!')
			# 		# Random object
			# 		random_flag = rng.randi_range(0, number_of_object_MIN)
			# 		# Target flag to remove
			# 		object_to_remove = store_flag[random_flag]
			# 		# Clean storage
			# 		store_flag.erase(object_to_remove)
			# 		print(store_flag.size())
			# 		# Remove child

		
	else:
		pass


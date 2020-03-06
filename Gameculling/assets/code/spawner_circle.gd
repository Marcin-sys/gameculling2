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
var list									# Make list of object's.

#Circle
var radius = 20								# Circle radius 
var center = Vector3(0, 0, 0)				# Circle center
var count_segments = 20						# How much of an angle objects will be spaced around the circle.
var angle_step = 2.0 * PI / count_segments	# 2.0*PI = 360 degrees  / segments
var angle = 0								# Start point for angle
var angle_random							# Random angle for object
var posible_angle = [0]
var count_angle

func _ready():
	rng.randomize()

	for i in range(1, count_segments):
		count_angle = i * angle_step
		posible_angle.append(count_angle)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	time_left += delta
	TIME_SPAN = rng.randi_range(TIME_SPAN_MIN, TIME_SPAN_MAX)
	list = [cube_scene.instance(), cylinder_scene.instance(), sphere_scene.instance()] 


	if time_left > TIME_SPAN:
		# Random angle
		angle_random = posible_angle[randi() % posible_angle.size()]
		print(angle_random)

		# Position
		var direction = Vector3(cos(angle_random), 0, sin(angle_random))
		var position_object_edge_circle = center + direction * radius
		angle += angle_step

		
		if  node_counter < 100:
			var temporary_object = list[randi() % list.size()]
			temporary_object.set_translation(position_object_edge_circle)
			self.add_child(temporary_object)
			node_counter += 1

			# Reset time_left.
			time_left = 0
	else:
		pass


extends Node

var cube_scene = preload("res://scenes/cube.tscn")
var cylinder_scene = preload("res://scenes/cylinder.tscn")
var sphere_scene = preload("res://scenes/sphere.tscn")

var node_counter = 0					# For counting the number of objects on the screen
const TIME_SPAN = 1    					# Time period till function spawn another object
var time_left = 0						# Timer
var rng = RandomNumberGenerator.new()  	# Make seed for number.
var list								# Make list of object's.


# Called when the node enters the scene tree for the first time_left.
func _ready():
	rng.randomize()
	list = [cube_scene.instance(), cylinder_scene.instance(), sphere_scene.instance()] 

# Called every frame. 'delta' is the elapsed time_left since the previous frame.
func _process(delta):

	time_left += delta

	if time_left > TIME_SPAN:
		if  node_counter < 10:
			var temporary_object = list[randi() % list.size()]
			var random_position = Vector3(rng.randi_range(1,10), 0, rng.randi_range(1,10))
			temporary_object.set_translation(random_position)
			self.add_child(temporary_object)
			node_counter += 1
			# Reset time_left.
			time_left = 0
	else:
		pass

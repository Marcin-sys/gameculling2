extends Node

var cube_scene = preload("res://scenes/cube.tscn")
var cylinder_scene = preload("res://scenes/cylinder.tscn")
var sphere_scene = preload("res://scenes/sphere.tscn")

var Node_counter = 0	# For counting the number of objects on the screen
const TIME_SPAN = 1     # Time period till function spawn another object
var time_left = 0		# Timer

# Called when the node enters the scene tree for the first time_left.
#func _ready():
#	var cube_node = cube_scene.instance()
#	self.add_child(cube_node)
	

# Called every frame. 'delta' is the elapsed time_left since the previous frame.
func _process(delta):
	# Make seed fo number.
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	
	# Make list of object's.
	var list = [ cube_scene.instance() , cylinder_scene.instance() , sphere_scene.instance() ]


	time_left += delta
	if time_left > TIME_SPAN:
		if  Node_counter < 10:
			var drawned = list[randi() % list.size()]
			var random_position = Vector3(rng.randi_range(1,10) , 0, rng.randi_range(1,10) )
			drawned.set_translation(random_position)
			self.add_child(drawned)
			Node_counter += 1
			# Reset time_left.
			time_left = 0
	else:
		pass

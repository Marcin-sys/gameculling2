extends Node

var cube_scene = preload("res://scenes/cube.tscn")
var cylinder_scene = preload("res://scenes/cylinder.tscn")
var sphere_scene = preload("res://scenes/sphere.tscn")

var node_counter = 0					# For counting objects on the main scene
const TIME_SPAN = 1    					# Time period till function spawn another object
var time_left = 0						# Timer
var rng  								# RNG object
var scenes								# List of scenes

# Called when the node enters the scene tree for the first time_left.
func _ready():
	rng = RandomNumberGenerator.new()
	rng.randomize()
	scenes = [cube_scene, cylinder_scene, sphere_scene] 

# Called every frame. 'delta' is the elapsed time_left since the previous frame.
func _process(delta):
	if node_counter < 10:
		time_left += delta
		if time_left > TIME_SPAN:
			#Instancing new object on scene
			var generated_object = scenes[randi() % scenes.size()].instance()
			generated_object.set_translation(Vector3(rng.randi_range(1, 10), 0, rng.randi_range(1, 10)))
			self.add_child(generated_object)
			node_counter += 1
			# Reset time_left.
			time_left = 0

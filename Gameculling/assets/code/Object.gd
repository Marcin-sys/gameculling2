extends Spatial

const cube_scene = preload("res://scenes/cube.tscn")
const cylinder_scene = preload("res://scenes/cylinder.tscn")
const sphere_scene = preload("res://scenes/sphere.tscn")


var rng = RandomNumberGenerator.new()  			# Make seed for number.

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

class Object_Some:
	
	func new_object(position_object_edge_circle):
		var scenes = [cube_scene, cylinder_scene, sphere_scene]
			 
		var temporary_object = scenes[randi() % scenes.size()].instance()
		temporary_object.set_translation(position_object_edge_circle)
		
		return temporary_object
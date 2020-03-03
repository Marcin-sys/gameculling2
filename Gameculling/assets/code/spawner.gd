extends Node

var cube_scene = preload("res://scenes/cube.tscn")
var cylinder_scene = preload("res://scenes/cylinder.tscn")
var sphere_scene = preload("res://scenes/sphere.tscn")
var count = 0

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	var cube_node = cube_scene.instance()
	self.add_child(cube_node)
	var _delta = 1



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	
		if  count < 10:
			randomize()
			
			var list = [ cube_scene.instance() , cylinder_scene.instance() , sphere_scene.instance() ]	
			var drawned = list[randi() % list.size()]
			var random_position = Vector3(randi() % 11 + 1 , 0, randi() % 11 + 1)
			drawned.set_translation(random_position)
			self.add_child(drawned)
			count+=1
		else:
			pass

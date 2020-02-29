extends Node

var cube_scene = preload("res://scenes/cube.tscn")
var cylinder_scene = preload("res://scenes/cylinder.tscn")
var sphere_scene = preload("res://scenes/sphere.tscn")


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	var cube_node = cube_scene.instance()
	self.add_child(cube_node)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

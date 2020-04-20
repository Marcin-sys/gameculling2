extends MultiMeshInstance
var new_position = 0
var change_position = 10 # position where to spawn another mesh 
func _ready():
	# Create multimesh resource that will contain 4  mesh
	var mm = MultiMesh.new()
	mm.transform_format = MultiMesh.TRANSFORM_3D

	mm.instance_count = 4
	
	#mm.mesh = preload("res://scenes/Mesh_scene.tscn")

	# Set mesh
	for i in range(mm.instance_count):
		var pos = Vector3(new_position,0,0)
		new_position += change_position
		mm.set_instance_transform(i, Transform(Basis(), pos))

	# Assign multimesh to be rendered by the MultiMeshInstance
	self.multimesh = mm

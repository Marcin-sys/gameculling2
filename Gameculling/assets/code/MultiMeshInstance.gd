extends MultiMeshInstance


func _ready():
    # Create multimesh resource that will contain 4 cubes
    var mm = MultiMesh.new()
    mm.transform_format = MultiMesh.TRANSFORM_3D
    mm.instance_count = 4
    mm.mesh = preload("res://cube.obj")

    # Set position of all cubes at random
    for i in range(mm.instance_count):
        var pos = Vector3(rand_range(-2, 2), rand_range(-2, 2), rand_range(-2, 2))
        var t = Transform(Basis(), pos)
        mm.set_instance_transform(i, t)

    # Assign multimesh to be rendered by the MultiMeshInstance
    self.multimesh = mm
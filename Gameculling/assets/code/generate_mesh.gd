extends MeshInstance

var tmpMesh = Mesh.new()
var vertices = PoolVector3Array()      #lista Vector3
var UVs = PoolVector2Array()          #lista Vector2
var mat = SpatialMaterial.new()

func _ready():
	vertices.push_back(Vector3(0,0,0))
	vertices.push_back(Vector3(10,0,0))
	vertices.push_back(Vector3(0,0,10))

	vertices.push_back(Vector3(10,0,0))
	vertices.push_back(Vector3(10,0,10))
	vertices.push_back(Vector3(20,0,0))

	# UVs.push_back(Vector2(0,0))
	# UVs.push_back(Vector2(0.5,0))
	# UVs.push_back(Vector2(0,0.5))

	# UVs.push_back(Vector2(0.5,0))
	# UVs.push_back(Vector2(0.5,0.5))
	# UVs.push_back(Vector2(1,0))



	var st = SurfaceTool.new()
	st.begin(Mesh.PRIMITIVE_TRIANGLES)
	st.set_material(mat)


	for v in vertices.size():
		#st.add_uv(UVs[v])
		st.add_vertex(vertices[v])

	st.commit(tmpMesh)

	self.mesh = tmpMesh

func _process(delta):
	self.rotate(Vector3(1, 0, 0), delta * 2)
	self.rotate(Vector3(0, 0, 1), delta * 2)

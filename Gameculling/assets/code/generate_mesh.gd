extends MeshInstance

var tmpMesh = Mesh.new()
var vertices = PoolVector3Array()      #lista Vector3
var UVs = PoolVector2Array()          #lista Vector2
var mat = SpatialMaterial.new()
var position_x_x
func _ready():
	for i in range(0,110,10):
		var position_x = 0 + i
		print(i)
		for i in range(0,110,10):
			var position_z = 0 + i
			for i in range(0,20,10):
				position_x_x = i
				vertices.push_back(Vector3(position_x_x + position_x, 0, 0 + position_z))

		# vertices.push_back(Vector3(0+position_x,0,10))  #first
		# vertices.push_back(Vector3(10+position_x,0,10))
		# vertices.push_back(Vector3(0+position_x,0,20))
		# vertices.push_back(Vector3(10+position_x,0,20))
		# vertices.push_back(Vector3(0+position_x,0,30)) #five
		# vertices.push_back(Vector3(10+position_x,0,30))
		# vertices.push_back(Vector3(0+position_x,0,40)) #five
		# vertices.push_back(Vector3(10+position_x,0,40))
		# vertices.push_back(Vector3(0+position_x,0,50)) #five
		# vertices.push_back(Vector3(10+position_x,0,50))
		# vertices.push_back(Vector3(0+position_x,0,60)) #five
		# vertices.push_back(Vector3(10+position_x,0,60))
		# vertices.push_back(Vector3(0+position_x,0,70)) #five
		# vertices.push_back(Vector3(10+position_x,0,70))
		# vertices.push_back(Vector3(0+position_x,0,80)) #five
		# vertices.push_back(Vector3(10+position_x,0,80))
		# vertices.push_back(Vector3(0+position_x,0,90)) #five
		# vertices.push_back(Vector3(10+position_x,0,90))
		# vertices.push_back(Vector3(0+position_x,0,100)) #five
		# vertices.push_back(Vector3(10+position_x,0,100))

		# UVs.push_back(Vector2(0,0))
		# UVs.push_back(Vector2(0.5,0))
		# UVs.push_back(Vector2(0,0.5))
		# UVs.push_back(Vector2(0.5,0))
		# UVs.push_back(Vector2(0.5,0.5))
		# UVs.push_back(Vector2(1,0))
		var st = SurfaceTool.new()
		st.begin(Mesh.PRIMITIVE_TRIANGLE_STRIP)
		st.set_material(mat)

		for v in vertices.size():
			#st.add_uv(UVs[v])
			st.add_vertex(vertices[v])



		st.commit(tmpMesh)

		self.mesh = tmpMesh

# func _process(delta):
# 	self.rotate(Vector3(1, 0, 0), delta * 2)
# 	self.rotate(Vector3(0, 0, 1), delta * 2)

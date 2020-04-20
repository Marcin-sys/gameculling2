extends MeshInstance

var tmpMesh = Mesh.new()
var vertices = PoolVector3Array()      #lista Vector3
var UVs = PoolVector2Array()          #lista Vector2
var mat = SpatialMaterial.new()
var position_x_x
var mesh_count = 10
var change_starting_position_y = 0
func _ready():
	for _i in range(0,mesh_count):
		print('jestem')		
		change_starting_position_y +=10
		for i in range(change_starting_position_y - 10,0 + change_starting_position_y,10):   # if y = 110 => 10 x 10 
			var position_x = 0 + i
			
			for i in range(0,110,10):
				var position_z = 0 + i
				for i in range(0,20,10):
					position_x_x = i
					vertices.push_back(Vector3(position_x_x + position_x, 0 , 0 + position_z))
		

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
			print('przed')
			self.mesh = tmpMesh
			print('po')

# func _process(delta):
# 	self.rotate(Vector3(1, 0, 0), delta * 2)
# 	self.rotate(Vector3(0, 0, 1), delta * 2)

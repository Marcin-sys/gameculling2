extends Spatial

var my_object_id = 0
var time_left = 0
var time_to_death = 0

func set_time_to_death(time: int):
	time_to_death = time

func _ready():
	pass

func _process(delta):


	time_left += delta
	
	if time_left > time_to_death:
		print("jestem obiektem nr:", my_object_id , "i wsłaśnie umarłem")
		queue_free()

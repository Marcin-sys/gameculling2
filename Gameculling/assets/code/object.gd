extends Spatial


var rng = RandomNumberGenerator.new() # Make seed for number.
var my_object_id = 0
var time_left = 0
var time_when_disappear


func _ready():
	rng.randomize()
	time_when_disappear = rng.randi_range(5, 10)

func _process(delta):


	time_left += delta
	print(time_when_disappear," : czas obiektu : ",time_left)
	

	if time_left > time_when_disappear:
		print("jestem obiektem nr:", my_object_id , "i wsłaśnie umarłem")
		queue_free()
		time_left = 0 #TODO: usunac po dodaniu zabijania

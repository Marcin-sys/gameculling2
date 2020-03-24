extends Spatial

onready var node_generator = get_node('spawner_circle')
var rng = RandomNumberGenerator.new() # Make seed for number.
var my_object_id = 0
var time_when_disappear

func _ready():
    time_when_disappear = node_generator.time_disappear()

func _process(delta):

    time_left += delta

    if time_left > time_when_disappear:
        print("jestem obiektem nr:" + my_object_id + "i wsłaśnie umarłem")
        time_left = 0 #TODO: usunac po dodaniu zabijania

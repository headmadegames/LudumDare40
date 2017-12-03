extends Position2D

export(Vector2) var dir

func _ready():
	set_physics_process(true)
	pass

func _physics_process(delta):
#	get_parent().apply_impulse(get_position(), dir)
	get_parent().add_force(get_position(), dir)
	

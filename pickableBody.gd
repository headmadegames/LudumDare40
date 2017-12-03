extends RigidBody2D

onready var global = get_node("/root/global")

var debugEnabled = true
var wasPressed = false
var impulse = Vector2(0, 0)
var offset = Vector2(0, 0)

func applyImpulse(offset, value):
	print("Applying impulse ", value)
	self.impulse = value
	self.offset = offset
	.apply_impulse(offset, value)

func _ready():
	set_process_unhandled_input(true)
	set_physics_process(true)
	
	connect("input_event", self, "_on_body_input_event")
	connect("draw", self, "_on_body_draw")

func _physics_process(delta):
	if self.wasPressed and self.debugEnabled:
		impulse = (self.get_global_mouse_position()-self.global_position).clamped(10*(global.score+1))
		self.apply_impulse(Vector2(0,0), impulse)
#		print("Offset ", offset)
#		self.apply_impulse(offset, impulse)
#		add_force(offset, impulse)
		update()
		
func _on_body_draw():
	var pos = position + offset
	draw_line(pos, pos+impulse, Color(1,0,0,1),10)
	
func _unhandled_input(event):
	if (typeof(event) == TYPE_OBJECT and event.is_class("InputEventMouseButton") and event.button_index == 1 and !event.is_pressed() and !event.is_echo()):
		self.wasPressed = false
		print("Released")

func _on_body_input_event( viewport, event, shape_idx ):
	if (typeof(event) == TYPE_OBJECT and event.is_class("InputEventMouseMotion")):
		pass
	elif (typeof(event) == TYPE_OBJECT and event.is_class("InputEventMouseButton") and event.button_index == 1 and event.is_pressed() and !event.is_echo()):
		self.wasPressed = true
		self.offset = self.get_global_mouse_position() - self.global_position
		print("clicked")
	elif (typeof(event) == TYPE_OBJECT and event.is_class("InputEventMouseButton") and event.button_index == 1 and !event.is_pressed() and !event.is_echo()):
		self.wasPressed = false
		print("Released")


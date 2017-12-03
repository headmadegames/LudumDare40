extends Node2D

export(bool) var isPlayer = false
export(Color) var color = Color(0.6 ,0.2 ,0.2 ,1)

onready var global = get_node("/root/global")
onready var wheel = get_node("body/PinJoint2D/wheel")
onready var body = get_node("body")
onready var bodySprite = get_node("body/Sprite")
onready var rightArmSprite = get_node("body/rightArm/limb/CollisionShape2D/Sprite")
onready var leftArmSprite = get_node("body/leftArm/limb/CollisionShape2D/Sprite")
#onready var rightLegSprite = get_node("body/rightLeg/limb/CollisionShape2D/Sprite")
#onready var leftLegSprite = get_node("body/leftLeg/limb/CollisionShape2D/Sprite")
#onready var rightCalfSprite = get_node("body/rightLeg/limb/rightCalf/limb/CollisionShape2D/Sprite")
#onready var leftCalfSprite = get_node("body/leftLeg/limb/leftCalf/limb/CollisionShape2D/Sprite")
#onready var leftKnee = get_node("body/leftLeg/limb/Position2D")
#onready var leftFoot = get_node("body/leftLeg/limb/leftCalf/limb/Position2D")
#onready var rightKnee = get_node("body/rightLeg/limb/Position2D")
#onready var rightFoot = get_node("body/rightLeg/limb/rightCalf/limb/Position2D")

var impulses = []
var startPoints = []

func _ready():
	set_physics_process(true)
	if isPlayer:
		set_process_input(true)
		body.add_to_group("player")
	
	randomize()
	color = Color(randf(),randf(),randf(),1)
	bodySprite.self_modulate = color
	rightArmSprite.modulate = color
	leftArmSprite.modulate = color
#	rightLegSprite.modulate = color
#	leftLegSprite.modulate = color
#	rightCalfSprite.modulate = color
#	leftCalfSprite.modulate = color
	
func _input(event):
#	if (typeof(event) == TYPE_OBJECT and event.is_class("InputEventKey") and event.is_action_pressed("ui_left")):
#		print("Event ", event.get_class())
	pass
		
func _physics_process(delta):
	#right leg
	if isPlayer:
#		if (Input.is_action_pressed("ui_left")):
#			body.apply_impulse(Vector2(0, -40), Vector2(10, 0))
#			rightKnee.get_parent().apply_impulse(Vector2(0, 0), Vector2(5, -10))
#			rightFoot.get_parent().apply_impulse(Vector2(0, -20), Vector2(5, -5))
#		elif (Input.is_action_pressed("ui_right")):
#			body.apply_impulse(Vector2(0, 40), Vector2(-20, 0))
#			rightKnee.get_parent().apply_impulse(Vector2(0, 0), Vector2(20, 0))
#		if (Input.is_action_pressed("ui_up")):
#			body.apply_impulse(Vector2(0, -40), Vector2(-5, 20))
#			rightKnee.get_parent().apply_impulse(Vector2(20, 0), Vector2(5, -20))
#		elif (Input.is_action_pressed("ui_down")):
#			rightFoot.get_parent().apply_impulse(Vector2(0, 20), Vector2(0, 10))
#			rightKnee.get_parent().apply_impulse(Vector2(0, 0), Vector2(0, -20))
#			body.apply_impulse(Vector2(0, 0), Vector2(0, -5))
		
		#left leg
#		if (Input.is_action_pressed("left")):
#			body.apply_impulse(Vector2(0, -40), Vector2(20, 0))
#			leftKnee.get_parent().apply_impulse(Vector2(0, 0), Vector2(-20, 0))
#		elif (Input.is_action_pressed("right")):
#			body.apply_impulse(Vector2(0, 40), Vector2(5, 0))
#			leftKnee.get_parent().apply_impulse(Vector2(0, 0), Vector2(5, 10))
#			leftFoot.get_parent().apply_impulse(Vector2(0, -20), Vector2(5, 5))
#		if (Input.is_action_pressed("up")):
#			body.apply_impulse(Vector2(0, -40), Vector2(5, 20))
#			leftKnee.get_parent().apply_impulse(Vector2(-20, 0), Vector2(-5, -20))
#		elif (Input.is_action_pressed("down")):
#			leftFoot.get_parent().apply_impulse(Vector2(0, 20), Vector2(0, 10))
#			leftKnee.get_parent().apply_impulse(Vector2(0, 0), Vector2(0, -20))
#			body.apply_impulse(Vector2(0, 0), Vector2(0, -5))
		
		var speed = 0
		if (Input.is_action_pressed("left")):
			speed = -10
		elif (Input.is_action_pressed("right")):
			speed = 10	
		wheel.set_angular_velocity(speed)
		
#	body.move_and_collide(body.get_local_mouse_position())
	var impulse = body.get_global_mouse_position() - body.global_position
	impulse.y = 0
#	body.apply_impulse(Vector2(0,0), impulse.clamped(10))
	body.add_force(Vector2(0,0), impulse.clamped(2))
#	body.move_and_collide(impulse)
	pass
	

func _on_puppet_draw():
	while startPoints.size() > 0:
		var pos = startPoints.pop_front()
		var impulse = impulses.pop_front()
		draw_line(pos, pos+impulse, Color(1,0,0,0.2*startPoints.size()+0.2),10)
	pass # replace with function body

extends Control

onready var player = get_node("player")
onready var global = get_node("/root/global")

var puppetScene = preload("res://puppet.tscn")

func _ready():
	for i in range(global.score):
		var node = puppetScene.instance()
		add_child(node)
		node.set_position(player.get_position() + (i+1) * Vector2(0,-130))
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass


func _on_Area2D_body_entered( body ):
	print("body.is_in_group('player') ", body.is_in_group("player"))
	if body.is_in_group("player"):
		get_node("/root/global").incScore()
		get_tree().change_scene("res://game.tscn")
extends Node

var score = 1

func _ready():
	var root = get_tree().get_root()

func incScore():
	score += 1

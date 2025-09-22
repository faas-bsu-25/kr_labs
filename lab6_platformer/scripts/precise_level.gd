extends Node2D

var score: int = 0
@export var scoreLabel: Label

func coin_collected():
	score += 1
	scoreLabel.text = "Coins - %d" % score
	
	if score >= 5:
		get_tree().change_scene_to_file("res://lab6_platformer/components/imprecise_level.tscn")

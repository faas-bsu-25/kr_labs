extends Node2D

@export var score: int = 0
@export var label: Label

func coin_collected():
	score += 1
	label.text = str(score)

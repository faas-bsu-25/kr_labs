extends Node2D

var score = 5
@export var txtScore: Label

func _ready() -> void:
	txtScore.text = str(score)

func increment_score():
	score += 1
	txtScore.text = str(score)

extends MarginContainer

@onready var score_counter = $HBoxContainer/ScoreCounter

func update_score(value):
	score_counter.display_digits(value)

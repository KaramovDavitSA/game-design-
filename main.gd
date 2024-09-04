extends Node2D

var enemy = preload("res://enemy.tscn")

func _ready():
	spawn_enemies()

func spawn_enemies():
	for x in 9:
		for y in 3:
			var e = enemy.instantiate()
			var pos = Vector2(x * (16+8) +24, 16*2 + y * 25 )
			add_child(e)
			e.position = pos
	

extends Area2D

@export var cooldown = 0.25
@export var animdown = 0.1
@export var bullet_scene : PackedScene
@export var speed = 150
@onready var screensize = get_viewport_rect().size
var can_shoot = true


func _ready():
	$Timer.wait_time = cooldown
	$animtimer.wait_time = animdown
	position = Vector2(120, 250)
	
func shoot():
	if not can_shoot:
		return
	can_shoot = false
	$Timer.start()
	var b = bullet_scene.instantiate()
	$AudioStreamPlayer2D.play()
	get_tree().root.add_child(b)
	b.start(position + Vector2(0,-8))
	
func _process(delta):
	$animtimer.start()
	if Input.is_action_pressed("shoot"):
		shoot()
	var input = Input.get_vector("left", "right", "up", "down")
	if input.x > 0:
		$Sprite2D.frame = 2
	elif input.x < 0:
		$Sprite2D.frame = 0
	else:
		$Sprite2D.frame = 1
		

	position += input * speed * delta
	position = position.clamp(Vector2.ZERO, screensize)
	
func _on_timer_timeout():
	can_shoot = true

func _on_animtimer_timeout():
	$AnimatedSprite2D.frame += 1

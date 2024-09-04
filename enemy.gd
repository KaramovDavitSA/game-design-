extends Area2D

func explode():
	$AnimatedSprite2D.visible = true
	$Sprite2D.visible = false
	$AnimatedSprite2D.play("explosion")
	await $AnimatedSprite2D.animation_finished
	queue_free()

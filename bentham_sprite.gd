extends Sprite2D

@onready var screen_size = get_viewport_rect().size
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	position = Vector2(1152/2, 700/2)

var velocity = Vector2(100, 100)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.x += velocity * delta	
	position.x = wrapf(position.x, 0, screen_size.x)
	position.y = wrapf(position.y, 0, screen_size.y)
	

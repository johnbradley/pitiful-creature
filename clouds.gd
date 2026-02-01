extends Sprite2D

var speed: float

func _ready():
	frame = randi() % hframes
	speed = randf_range(10.0, 50.0)
	var s = randf_range(1.0, 2.0)
	scale = Vector2(s, s)
	position.x = randf_range(200, 2100)
	position.y = randf_range(-120, 100)

func _process(delta):
	position.x -= speed * delta
	
	if position.x < -1200:
		position.x = 2300
		position.y = randf_range(0, 100)
		frame = randi() % hframes
		speed = randf_range(20.0, 60.0)
		var s = randf_range(1.0, 2.0)
		scale = Vector2(s, s)

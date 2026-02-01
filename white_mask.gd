extends Area2D

const WHITE_MASK_AREA = "white-mask"

func _ready():
	body_entered.connect(_on_body_entered)
	body_exited.connect(_on_body_exited)
	if GameManager.has_mask(GameManager.MASK_DAPPER):
		get_parent().queue_free()

func _on_body_entered(body):
	if body.is_in_group("player"):
		GameManager.player_enter_area(WHITE_MASK_AREA)

func _on_body_exited(body):
	if body.is_in_group("player"):
		GameManager.player_leave_area(WHITE_MASK_AREA)

func _input(event: InputEvent) -> void:
	if event is InputEventKey and event.pressed:
		var keycode = event.keycode
		if keycode == KEY_E or Input.is_joy_button_pressed(0, JOY_BUTTON_B):
			if GameManager.player_in_area("white-mask"):
				GameManager.acquire_mask(GameManager.MASK_DAPPER)
				get_parent().queue_free()

extends CanvasLayer

var names: Array[String];
var icons: Array[Sprite2D]
var glows: Array[Sprite2D];
var label: Label;

func _ready() -> void:
	GameManager.inventory_changed.connect(_on_inventory_changed)
	GameManager.player_in_group_changed.connect(_on_player_in_group_changed)
	names = [
		GameManager.NO_MASK,
		GameManager.MASK_DAPPER,
		GameManager.MASK_2,
		GameManager.MASK_3
	]
	icons = [$MaskNoneIcon, $MaskWhiteIcon, $MaskBlueIcon, $MaskRedIcon]
	glows = [$MaskNoneGlow, $MaskWhiteGlow, $MaskBlueGlow, $MaskRedGlow]
	label = $Label

func _on_inventory_changed(mask_id) -> void:
	# If it was a mask, update the mask UI
	update_mask_ui()

func _on_player_in_group_changed() -> void:
	if GameManager.player_in_areas:
		label.text = "Press 'E'"
	else:
		label.text = ""

func update_mask_ui():
	show_collected_masks()
	show_selected_mask()

func show_collected_masks() -> void:
	var idx: int = 0
	for child in icons:
		var mask_name = names[idx]
		if GameManager.masks_collected[mask_name]:
			child.visible = true
		idx += 1


func show_selected_mask() -> void:
	var idx: int = 0
	for child in glows:
		var mask_name = names[idx]
		if mask_name == GameManager.current_mask_name:
			child.visible = true
		else:
			child.visible = false
		idx += 1

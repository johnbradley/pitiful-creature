extends Node

var current_level: int = 1
var masks_collected: Dictionary = {}

const MASK_NAMES = ["MASK 1", "MASK 2", "MASK 3"]
const NUM_MASKS = 3

func _ready() -> void:
	# print("Initializing GameManager")
	for i in range(NUM_MASKS):
		masks_collected[MASK_NAMES[i]] = false

func acquire_mask(mask_id) -> void:
	masks_collected[mask_id] = true

func has_mask(mask_id) -> bool:
	return masks_collected[mask_id]

#func change_level(level_path: String):
	#get_tree().change_scene_to_file(level_path)

func reset_game():
	current_level = 1

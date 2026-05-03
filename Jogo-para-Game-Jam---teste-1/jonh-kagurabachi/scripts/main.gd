extends Node2D

const PLATE_SCENE = preload("res://scenes/plate.tscn")

func _on_heroi_game_over() -> void:
	print("game over")

func _on_timer_timeout() -> void:
	var plate: Node2D = PLATE_SCENE.instantiate()
	
	plate.position = Vector2(randf_range(708, 128) , 0)
	
	add_child(plate)
 

extends Node2D

var altura: int = 55
var valor: float = 0.05
##func _physics_process(delta: float) -> void:
	##position.y += get_altura() * delta

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()


func _on_timer_plate_timeout() -> void:
	
	position.y += altura
	

func _on_timer_timeout() -> void:
	
	$TimerPlate.wait_time -= valor
	
	

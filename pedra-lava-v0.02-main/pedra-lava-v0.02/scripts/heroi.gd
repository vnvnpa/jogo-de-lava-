extends CharacterBody2D

@onready var animated_spite = $AnimatedSprite2D

signal game_over

const SPEED = 80.0
const JUMP_VELOCITY = -600.0


func _physics_process(delta: float) -> void:
	
	if not is_on_floor():
		velocity += get_gravity() * delta
		animated_spite.play("Fall")
	
	if is_on_floor():
		animated_spite.play("Idle")
	
	
	if Input.is_action_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		animated_spite.play("Jump")
	
	elif Input.is_action_pressed("left"):
		position.x -= SPEED/10
		animated_spite.play("Walk")
		$AnimatedSprite2D.flip_h = true
	
	elif Input.is_action_pressed("right"):
		position.x += SPEED/10
		animated_spite.play("Walk")
		$AnimatedSprite2D.flip_h = false
	
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	
	move_and_slide()

func _on_area_2d_area_entered(area: Area2D) -> void:
	game_over.emit()

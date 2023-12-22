extends CharacterBody2D


const SPEED = 308.0
const JUMP_VELOCITY = -550.0
const LEVEL_LIMIT = 2000

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
#var level = 1

@onready var animation = $Animation


func _physics_process(delta):
	if position.y > LEVEL_LIMIT:
		endGame()
	
	if Input.is_action_just_pressed("restart"):
		get_tree().change_scene_to_file("res://Level1.tscn")
	
	if Input.is_action_just_pressed("exit"):
		get_tree().quit()
	
	if not is_on_floor():
		velocity.y += gravity * delta

	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	var direction = Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	animate()

func animate():
	if velocity.y != 0 and velocity.x > 0:
		animation.play("jump")
		animation.flip_h = false
	elif velocity.y != 0 and velocity.x < 0:
		animation.play("jump")
		animation.flip_h = true
	elif velocity.x > 0:
		animation.play("walk")
		animation.flip_h = false
	elif velocity.x < 0:
		animation.play("walk")
		animation.flip_h = true
	else: animation.play("idle")

func endGame():
	get_tree().change_scene_to_file("res://GameOver.tscn")

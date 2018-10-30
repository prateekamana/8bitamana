extends KinematicBody2D

onready var ground_ray = get_node("ground_ray")
onready var sprite = get_node("sprite")
var anim = "idle"
const ACCEL = 1500
const MAX_SPEED = 500
const FRICTION = -500
const GRAVITY = 2000
const JUMP_SPEED = -1000

var vel = Vector2()
var acc = Vector2()

func _ready():
	set_physics_process(true)
	set_process_input(true)
	
func _input(event):
	if Input.is_action_pressed("ui_up") and ground_ray.is_colliding():
		vel.y = JUMP_SPEED
		anim = "movement"
	if Input.is_action_pressed("ui_left"):
		anim = "movement"
		sprite.set_flip_h(true)
	elif Input.is_action_pressed("ui_right"):
		anim = "movement"
		sprite.set_flip_h(false)
	else:
		anim = "idle"
	
func _physics_process(delta):
	# HORIZONTAL MOVEMENT
	acc.y = GRAVITY
	acc.x = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
	acc.x *= ACCEL
	if acc.x == 0:
		acc.x = vel.x * FRICTION  * delta
	
	vel += acc * delta
	vel.x = clamp(vel.x, -MAX_SPEED, MAX_SPEED)
	
		
#	if vel.x == 0:
#		anim = "idle"
#	else:
#		anim = "movement"
#	if vel.x < 0 :
#		sprite.set_flip_h(true)
#	if vel.x > 0:
#		sprite.set_flip_h(false)
		
	sprite.play(anim)
	vel = move_and_slide(vel, Vector2(0, -1))
	
	
	

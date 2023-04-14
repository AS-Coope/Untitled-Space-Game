extends Area2D

#Global variable and constant declarations and initialization
#CONSTANT DECLARATIONS
#VARIABLE DECLARATIONS

signal shootUp
signal shootDown
signal shootLeft
signal shootRight

var plBullet = preload("res://SShipBullet.tscn")
var plBulletCode = preload("res://SShipBullet.gd")
onready var animatedSprite = $AnimatedSprite/AnimationPlayer
onready var firingPositions = $FiringPosition
onready var coolDownTimer = $Cooldown

var speed = Vector2.ZERO
export var acceleration = 200
var direction = Vector2.ZERO

export var cooldown = 0.1

func _process(delta):
	if Input.is_action_pressed("shoot") and coolDownTimer.is_stopped():
		coolDownTimer.start(cooldown)
		# Accesses all the children in the Firing Position node and applies the
		# command in the for loop to all children of that node (hence, the left
		# fire node and right fire node)
		for child in firingPositions.get_children():
			var bullet = plBullet.instance()
			# when the player shoots a bullet it is instanced to come from each
			# child in the Firing Position node
			bullet.global_position = child.global_position
			# gets the game space ship tree then gets the scene it is currently 
			# being created in, which is the world scene because that's where the
			# game is played (it is added to the world scene by add_child)
			get_tree().current_scene.add_child(bullet)

func _physics_process(delta):
	
	#_ship_rotate(delta)
	
	var input_vector = Vector2.ZERO
	# makes the spaceship move right or left
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.x *= acceleration
	# makes the spaceship move up or down
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input_vector.y *= acceleration
	
	# transferring the input_vector values to the speed vector
	speed = input_vector
	
	# allows the spaceship to move on screen and slide if it
	# hits another object
	# how to move using a kinematicbody2D
	# speed = move_and_slide(speed)
	
	# How to move in Area2D
	position += speed * delta
	
	# Making sure we are within the screen
	
	# Returns a rectangle that represents the viewport
	var viewportRect = get_viewport_rect()
	position.x = clamp(position.x, 0, viewportRect.size.x)
	position.y = clamp(position.y, 0, viewportRect.size.y)

func _ship_rotate(delta):
	
	# Will update to actually work after finishing base game
	
	# changes the position of the orientation of the ship (which
	# way the ship is facing)
	if Input.is_action_just_pressed("rotate_up"):
		animatedSprite.play("ShipUp")
		firingPositions.set_rotation_degrees(0)
		emit_signal("shootUp")
	elif Input.is_action_just_pressed("rotate_down"):
		animatedSprite.play("ShipDown")
		firingPositions.set_rotation_degrees(180)
		emit_signal("shootDown")
	elif Input.is_action_just_pressed("rotate_left"):
		animatedSprite.play("ShipLeft")
		firingPositions.set_rotation_degrees(90)
		emit_signal("shootLeft")
	elif Input.is_action_just_pressed("rotate_right"):
		animatedSprite.play("ShipRight")
		firingPositions.set_rotation_degrees(270)
		emit_signal("shootRight")


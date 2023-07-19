extends Area2D

# meteor movement
export var minSpeed = 10
export var maxSpeed = 20

export var minRotationRate = -10
export var maxRotationRate = 10

#Enemy Health HUD
export var life = 75
onready var m_health = $MeteorHUD/MeteorHealth

var speed = 0.0
var rotationRate = 0

func _ready():
	# runs only once when the meteor node is added to a tree in the game
	# chooses a random speed that the meteor will move at constantly
	# when it is instantiated
	speed = rand_range(minSpeed, maxSpeed)
	rotationRate = rand_range(minRotationRate, maxRotationRate)
	m_health.set_text("Meteor Health: " + str(life))

func _physics_process(delta):
	rotation_degrees += rotationRate * delta
	position.y += speed * delta

func damage(amount: int):
	life -= amount
	# displays meteor health in the display tab
	print("Life: ", life)
	# displays meteor health on the screen
	m_health.set_text("Meteor Health: " + str(life))
	if life <= 0:
		queue_free()
	

func _on_VisibilityNotifier2D_viewport_exited(viewport):
	queue_free()

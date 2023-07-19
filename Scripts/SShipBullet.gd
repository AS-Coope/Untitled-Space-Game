extends Area2D

export var bulletSpeed = 500.0

func _ready():
	var _shipNode = get_tree().get_root().find_node("GameSpaceShip", true, false)
	#shipNode.connect("shootUp", self, "shootBulletUp")
	#shipNode.connect("shootDown", self, "shootBulletDown")
	#shipNode.connect("shootLeft", self, "shootBulletLeft")
	#shipNode.connect("shootRight", self, "shootBulletRight")
	
func _physics_process(delta):
	
	position.y -= bulletSpeed * delta

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()

func shootBulletUp(timespan):
	position.y -= bulletSpeed * timespan
	print("Signal Up chosen") 
	
func shootBulletDown(timespan):
	position.y += bulletSpeed * timespan
	print("Signal Down chosen")
	
func shootBulletLeft(timespan):
	position.x -= bulletSpeed * timespan
	
func shootBulletRight(timespan):
	position.x += bulletSpeed * timespan

func _on_SShipBullet_area_entered(area):
	if area.is_in_group("damageable"):
		area.damage(1)
		queue_free()

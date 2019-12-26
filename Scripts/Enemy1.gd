extends Area2D

export var enemy_velocity = Vector2()
export (PackedScene) var enemy_laser
export (PackedScene) var enemy_explosion
var type = "enemy1"

func _ready():
	pass
	
func _process(delta):
	translate(enemy_velocity * delta)
	
	if position.x >= get_viewport_rect().size.x or position.x <= 0:
		enemy_velocity.x *= -1
	
	if position.y >= get_viewport_rect().size.y:
		queue_free()

func _on_EnemyShootTimer_timeout():
	var new_enemyLaser = enemy_laser.instance()
	new_enemyLaser.set_as_toplevel(true)
	new_enemyLaser.position = Vector2(position.x, position.y + 10)
	get_parent().add_child(new_enemyLaser)

func _on_Enemy1_area_entered(area):
	if area.type == "playerLaser" or area.type == "player":
		queue_free()

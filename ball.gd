extends RigidBody2D


func _physics_process(_delta):
	if abs(linear_velocity.x) < 15:
		linear_velocity.x += sign(linear_velocity.x) * 15
	elif abs(linear_velocity.y) < 300:
		linear_velocity.y = sign(linear_velocity.y) * 300

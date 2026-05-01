extends CharacterBody2D
@export var Ball : PackedScene
var speed = 250
var ballSpawn := false
var ballnum = 3

# Loss
func WahWah():
	if ballnum <= 0:
		if Save.winMaybe == false:
			Save.winMaybe = false
		get_tree().change_scene_to_file("res://lose_menu.tscn")
	


func _physics_process(_delta):
	# Basic Movement
	var move = Input.get_axis("ui_left", "ui_right")
	velocity.x = move * speed
	move_and_slide()
	
	WahWah()
	
	# Spawn Ball
	var playerPos = global_position
	var ballPos = playerPos + Vector2(0, -50)
	
	if Input.is_action_just_pressed("ui_accept") && ballSpawn == false:
		var newBall = Ball.instantiate()
		get_tree().current_scene.add_child(newBall)
		newBall.global_position = ballPos
		ballSpawn = true
		newBall.linear_velocity = Vector2(25, -300)

# Delete Ball
func _on_floor_body_entered(body: Node2D) -> void:
	body.queue_free()
	ballSpawn = false
	ballnum -= 1
	
